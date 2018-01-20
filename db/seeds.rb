# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

user_attributes = [
{provider: "Provider X", uid: "5555", username: "Testing User", email: "Test@TestUser.com", avatar_url: "TestUser"}
# {provider: "Provider E", uid: "22222", username: "KateSmith13", email: "Kate@KateSmith.com", avatar_url: "katesmitheurl"},
# {provider: "Provider F", uid: "33333", username: "BobSmith14", email: "Bob@BobSmith.com", avatar_url: "bobsmithurl"}
]

user_attributes.each do |user_attribute|
  User.create(user_attribute)
end

# meetup_attributes = [
# {name: "Alpha Dogs", description: "dogs", location: "Boston", creator: "Albie"},
# {name: "Winter Club", description: "Snow flakes", location: "Mountain", creator: "John"},
# {name: "Fast Friends", description: "Running Club", location: "Boston", creator: "JoJo"}
# ]
#
#
# meetup_attributes.each do |meetup_attribute|
#   Meetup.create(meetup_attribute)
# end

meetup_group = [
  {user_id: 7, meetup_id: 5}
  # {user_id: 5, meetup_id: 5},
  # {user_id: 6, meetup_id: 5},
]
#
meetup_group.each do |meetup|
  UserMeetup.create(meetup)
end
