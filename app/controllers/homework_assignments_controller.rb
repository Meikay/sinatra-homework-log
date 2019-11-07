class HomeworkAssignmentsController < ApplicationController
  
  get '/homework_assignments' do
    @homework_assignments = HomeworkAssignment.all
    erb :'/homework_assignments/index'    
  end
  
    # get homework_assignments/new to render a form to create new assignment
  get '/homework_assignments/new' do
    # redirect_if_not_logged_in
    erb :'/homework_assignments/new'
  end

  # post homework_assignment to create new assignment
  post '/homework_assignments' do
    # create assignment and save to DB only if
    # user is logged in
    redirect_if_not_logged_in
    # save assignment only if it has content
    if params[:subject] != "" && params[:notes] != "" 
      # create new assignment
      homework_assignment = HomeworkAssignment.create(subject: params[:subject], notes: params[:notes], user_id: current_user.id)
      redirect "/homework_assignments/#{homework_assignment.id}"
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

  # Finds hw assignment and sends us to edit page
  get '/homework_assignments/:id/edit' do
    find_assignment
    redirect_if_not_logged_in
        # if authorized_to_edit?(@homework_assignment) helper method doesnt work here
        if authorized_to_edit?(@homework_assignment)
            erb :'/homework_assignments/edit'
        else
            redirect "users/#{current_user.id}"
        end
  end

  # Finds hw assignment and update hw assignment and redirect to to show page
  patch '/homework_assignments/:id' do
    find_assignment
    # allows someone to edit only if they are the current_user
    redirect_if_not_logged_in 
      if homework_assignment.user == current_user && params[:subject] != "" && params[:notes] != "" 
      homework_assignment.update(subject: params[:subject], notes: params[:notes])
      redirect "/homework_assignments/#{homework_assignment.id}"
      else
        redirect "users/#{current_user.id}"
      end
  end

  delete '/homework_assignments/:id' do
    redirect_if_not_logged_in
    find_assignment
    if @homework_assignment.user == current_user
        #delete as
        @homework_assignment.destroy
        redirect '/homework_assignments'
    else
        #redirect
        redirect '/homework_assignments'
    end
  end


  private

  def find_assignment
    @homework_assignment = HomeworkAssignment.find_by_id(params[:id])
    if @homework_assignment == nil
      redirect '/homework_assignments'
    end
  end

end