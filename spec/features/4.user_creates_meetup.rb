require 'spec_helper'

# AS A USER I WANT TO CREATE A MEETUP
# SHOULD BE A LINK FROM THE MEETUPS INDEX PAGE THAT TAKES YOU TO MEETUPS NEW PAGE

# ON MEETUPS NEW PAGE THERE SHOULD BE A FORM TO CREATE A NEW MEETUP
# I MUST BE SIGNED IN AND I MUST SUPPLY NAME, LOCATION, AND DESCRIPTION
# IF FORM SUBMISSION SUCCESSFUL, I'M BROUGHT TO MEETUP'S SHOW PAGE AND I SHOULD SEE A "SUCCESS" MESSAGE
# IF FORM UNSUCCESSFUL I SHOULD REMAIN ON MEETUPS NEW PAGE AND SHOULD SEE ERROR MESSAGES
# FORM SHOULD BE PRE-FILLED WITH VALUES PROVIDED BEFORE FORM WAS SUBMITTED

feature "User creates a new meetup and" do

  scenario "user clicks a link from index page that goes to meetups new page" do
    visit '/'
    click_link 'Add new meetup'

    expect(page).to have_content("Name of Meetup")
  end

  scenario "user visits form page" do
    visit '/form'

    expect(page).to have_field("Enter Name:")
    expect(page).to have_field("Enter Location:")
    expect(page).to have_field("Enter Description:")
    expect(page).to have_button("Submit")
  end

  scenario "user fills out form successfully" do
    visit '/form'

    fill_in 'Enter Name:', with: 'Cat Things'
    fill_in 'Enter Location:', with: 'Boston'
    fill_in 'Enter Description:', with: 'For dogs and owners'
    fill_in 'Enter Creator:', with: 'The Dog King'
    click_button 'Submit'

    expect(page).to have_content('Cat Things')
    expect(page).to have_button('Join')
  end

  scenario "user fills out form unsuccessfully" do
    visit '/form'

    fill_in 'Enter Name:', with: 'Blank Meetup'
    click_button 'Submit'

    expect(page).to have_content('Please fill out all fields of the form!')
  end
end
