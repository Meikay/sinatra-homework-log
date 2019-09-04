class User < ActiveRecord::Base
    has_secure_password

    has_many :homework_assignment
end