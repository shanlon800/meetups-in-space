# require 'spec_helper'
#
# # AS A USER I WANT TO JOIN A MEETUP
# # ON MEETUP'S SHOW PAGE THERE SHOULD BE A BUTTON TO JOIN THE MEETUP IF I AM NOT SIGNED IN OR IF I AM SIGNED IN
# # IF I AM SIGNED IN AND CLICK THE BUTTON I SHOULD SEE A MSG THAT SAYS I HAVE JOINED THE MEETUP AND I SHOULD BE ADDED TO THE MEMBERS LIST
# # IF I AM NOT SIGNED IN AND I CLICK THE BUTTON I SHOULD SEE A MSG WHICH SAYS I MUST SIGN IN
#
# feature "user sees join button on meetup show page and adds themself" do
#
#   scenario "user clicks join and their info renders on page" do
#
#     meetup_variable = Meetup.create!({
#       name: "Pig Lovers", description: "For dogs and owners", location: "Cali", creator: "Jane Doe"
#       })
#
#
#     user = User.create!(
#       provider: "Random Provider", uid: "123", username: "Jack", email: "user@username.com", avatar_url: "randomURL"
#     )
#
#     user_meetup_variable = UserMeetup.create!({
#       user_id: 1, meetup_id: 1
#       })
#
#
#     visit '/meetups/1'
#     click_on 'Join'
#
#     expect(page).to have_content("123")
#     expect(page).to have_content("Jack")
#     expect(page).to have_content("email")
#   end
#
#
#   #
#   # scenario "if user isn't signed in, they see an error message" do
#   #
#   #   meetup_variable_1 = Meetup.create!({
#   #     name: "Pig Lovers", description: "For dogs and owners", location: "Cali", creator: "Jane Doe"
#   #     })
#   #
#   #
#   #
#   #
#   #
#   #
#   #   visit '/meetups/1'
#   #
#   #   expect(page).to have_button("Join")
#   #   expect(page).to have_content("You are not signed in")
#   # end
#
#
#
# end
