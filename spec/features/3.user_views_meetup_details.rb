require 'spec_helper'


# AS A USER I WANT TO VIEW THE DETAILS OF A MEETUP AND LINK TO MEETUPS
# SHOW PAGE.
# ON SHOW PAGE, I SHOULD SEE THE NAME, DESCRIPTION, LOCATION, AND CREATOR

feature "User views show page" do
  scenario "meetup name links to a show page" do

    meetup_variable = Meetup.create!({
      name: "Dog Lovers", description: "For dogs and owners", location: "Cali", creator: "Jane Doe"
      })

    visit '/'
    expect(page).to have_link(meetup_variable.name)
  end

  scenario "user views details of a meetup" do

    meetup_variable = Meetup.create!({
      name: "Dog Lovers", description: "For dogs and owners", location: "Cali", creator: "Jane Doe"
      })

     visit '/'
     click_link 'Dog Lovers'
     expect(page).to have_content(meetup_variable.name)
     expect(page).to have_content(meetup_variable.description)
     expect(page).to have_content(meetup_variable.location)
     expect(page).to have_content(meetup_variable.creator)
  end

end
