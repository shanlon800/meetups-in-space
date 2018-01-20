require 'spec_helper'

# AS A USER I WANT TO SEE WHO HAS ALREADY JOINED A MEETUP
# ON MEETUP SHOW PAGE I WANT TO SEE A LIST OF MEMBERS THAT JOINED THE MEETUP
# I SHOULD SEE EACH MEMBER'S AVATAR AND USERNAME

feature "user sees who has already joined a meetup" do

  scenario "user views meetup show page to see list of members" do
    meetup_variable = Meetup.create!({
      name: "Dog Lovers", description: "For dogs and owners", location: "Cali", creator: "Jane Doe"
      })

    user_variable = User.create!({
      provider: "Test", uid: "0123456", username: "iAmAuSer", email: "user@user.com", avatar_url: "www.user.com/url"
      })

    user_meetup_variable = UserMeetup.create!({
      user_id: 1, meetup_id: 1
      })

    visit '/meetups/1'

    expect(page).to have_content(meetup_variable.name)
    expect(page).to have_content(user_variable.provider)
    expect(page).to have_content(user_variable.username)
    expect(page).to have_content(user_variable.avatar_url)

  end
end
