# require 'spec_helper'
# # I want to view the details of a meetup
# # So that I can learn more about its purpose
#
# feature "User views details of the meetup on the meetup page" do
#   scenario "I want to view meetup details so I can learn more about it's purpose" do
#
#     meetup_variable = Meetup.create!({
#       name: "Dog Lovers", description: "For dogs and owners", location: "Cali", creator: "Jane Doe"
#       })
#
#     visit '/meetups/1'
#     expect(page).to have_content("Dog Lovers")
#     expect(page).to have_content("For dogs and owners")
#     expect(page).to have_content("Cali")
#     expect(page).to have_content("Jane")
#   end
#
#   scenario "names are going to the index page" do
#
#       meetup_variable_2 = Meetup.create!({
#       name: "Cat Lovers", description: "For cats and owners", location: "Boston", creator: "John Doe"
#       })
#
#
#     visit '/'
#       expect(page).to have_link("Cat Lovers")
#   end
# end
