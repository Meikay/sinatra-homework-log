#seed data to work with and test associations
#create 2 users

alice = User.create(username: "alice", password: "wonderland")
prince = User.create(username: "prince", password: "arabia")

HomeworkAssignment.create(subject: "Biology", notes: "Complete section 5 and answer section questions.", date: "October 15, 2019", user_id: "alice.id")
HomeworkAssignment.create(subject: "Physics", notes: "Study for chapter 4 test", date: "October 15, 2019", user_id: "prince.id")

#Use AR to pre-associate data:
alice.homework_assignment.create(notes: "We are building a project!")
prince.homework_assignment.create(notes: "Figure out how to build the project.")

