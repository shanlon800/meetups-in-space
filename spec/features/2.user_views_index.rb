require 'spec_helper'


# AS A USER I WANT TO SEE A LIST OF ALL AVAIL MEETUPS
# I SHOULD SEE THE NAME OF EACH MEETUP
# MEETUPS SHOULD BE LISTED ALPHABETICALLY

feature "User views home page" do
  scenario "views the name of the meetup on page" do

    meetup_variable = Meetup.create!({
      name: "Dog Lovers", description: "For dogs and owners", location: "Cali", creator: "Jane Doe"
      })

    visit '/'
    expect(page).to have_content("Dog Lovers")
  end

  scenario "names are listed alphabetically" do

      meetup_variable_2 = Meetup.create!({
      name: "Cat Lovers", description: "For cats and owners", location: "Boston", creator: "John Doe"
      })

      meetup_variable_1 = Meetup.create!({
      name: "Dog Lovers", description: "For dogs and owners", location: "Cali", creator: "Jane Doe"
        })

    visit '/'
      expect(page.body.index(meetup_variable_2.name)).to be < page.body.index(meetup_variable_1.name)
  end
end
