class HomeworkAssignmentsController < ApplicationController
  # get homework_assignments/new to render a form to create new assignment
  get '/homework_assignments/new' do
    erb :'/homework_assignments/new'
  end
  # post homework_assignment to create new assignment
  post '/homework_assigments' do
    # create assignment and save to DB only if
    # user is logged in
    if !logged_in?
      redirect '/'
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
    @homework_assignment = HomeworkAssignment.find(params[:id])
    erb :'/homework_assignments/show'
  end

  get '/homework_assignments/:id/edit' do
    erb :'/homework_assignments/edit'
  end


  # index route for all homework assignments
end