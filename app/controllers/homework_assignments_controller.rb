class HomeworkAssignmentsController < ApplicationController
  
  get '/homework_assignments' do
    @homework_assigments = HomeworkAssignment.all
    erb :'/homework_assignments/index'    
  end
  
    # get homework_assignments/new to render a form to create new assignment
  get '/homework_assignments/new' do
    erb :'/homework_assignments/new'
  end
  # post homework_assignment to create new assignment
  post '/homework_assigments' do
    # create assignment and save to DB only if
    # user is logged in
    if !logged_in?
      redirect '/index'
    end
    # save assignment only if it has content
    if params[:subject] != "" && params[:notes] != "" && params[:date] != ""
      # create new assignment
      @homework_assignment = HomeworkAssignment.create(subject: params[:subject], notes: params[:notes], date: params[:date], user_id: current_user.id)
      redirect "/homework_assignments/#{@homework_assignment.id}"
    else
      # throw an error for the user and tell them why
      redirect '/homework_assignments/new'  
    end
  end

  # show route for a homework_assignment
  get '/homework_assignments/:id' do
    # Find homework assignment
    find_assignment
    erb :'/homework_assignments/show'
  end

  # PROBLEM - CAN EDIT OTHER USER'S DATA WITHOUT BEING LOGGED IN, PLEASE FIX!!!!!
  # Finds hw assignment and sends us to edit page
  get '/homework_assignments/:id/edit' do
    find_assignment
    if logged_in?
        if authorized_to_edit?(@homework_assignment)
            erb :'/homework_assignments/edit'
        else
            redirect "users/#{current_user.id}"
        end
    else
        redirect '/index'
    end
  end

  # Finds hw assignment and update hw assignment and redirect to to show page
  patch '/homework_assigments/:id' do
    find_assignment
    # allows someone to edit only if they are the current_user
    if logged_in? 
      if @homework_assignment.user == current_user && params[:subject] != "" && params[:notes] != "" && params[:date] != ""
      @homework_assignment.update(subject: params[:subject], notes: params[:notes], date: params[:date])
      redirect "/homework_assignments/#{@homework_assignment.id}"
      else
        redirect "users/#{current_user.id}"
      end
    else
      redirect '/'  
    end
  end

  # index route for all homework assignments


  private

  def find_assignment
    @homework_assignment = HomeworkAssignment.find(params[:id])
  end

end