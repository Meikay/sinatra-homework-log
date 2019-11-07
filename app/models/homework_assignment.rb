class HomeworkAssignment < ActiveRecord::Base

    belongs_to :user #we can use it on a single HomeworkAssignment object

    #creating an instance variable and assigning it to a specific hw assignment
    #@homework_assignment = HomeworkAssignment.find_by(id: ?) 

    #We are pulling up the user for this instance variable(for the instance of this particular hw assignment)
    #@homework_assignment.user

    #Pulling up a particular hw's username
    #@homework_assignment.user.username
    
end
