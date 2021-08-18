class User < ActiveRecord::Base
  #requires that a name is set when saving a user to the database
  validates :name, presence: true

  #Create
  # Each of this has the same result, creating a new user named David
  user = User.create(name: "David", occupation: "Dev")

  user = User.new
  user.name  "David"
  user.occupation = "Dev"
  user.save

  user = User.new do |u|
    u.name = "David"
    u.occupation = "Dev"
  end
  #user.save ?

  #Read
  #return a list of all users
  users = User.all

  #return only the first user
  user = User.first

  #return the first user named David
  david = User.find_by(name: 'David')

  #returns all users named David who are Devs and sorts the list by when they were created, descending
  users = User.where(name: 'David', occupation: 'Dev').order(created_at: :desc)

  #Update
  user = User.find_by(name: 'David')
  user.update(name: 'Dave')

  User.update_all "max_login_attempts = 3, must_change_password = 'true'"

  #Delete
  #deletes the first user named David
  user = User.find_by(name: 'David')
  user.destroy

  #deletes all the Davids
  User.destroy_by(name: 'David')

  #deletes all the users
  User.destroy_all
end
