class User < ActiveRecord::Base
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true

    has_many :homework_assignments #macro is used on a single user object

    # finding a user by id and assigning it to an instance variable
    # @user = User.find_by(id: ?)

    #Find all the homwork assigments of the user
    #@user.homework_assignments


    #
end