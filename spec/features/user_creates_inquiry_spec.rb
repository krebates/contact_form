require 'spec_helper'

feature "User contacts staff" do
  # As a site visitor
  # I want to contact the site's staff
  # So that I can tell them how awesome they are
  # Acceptance Criteria:

  # I must specify a valid email address
  # I must specify a subject
  # I must specify a description
  # I must specify a first name
  # I must specify a last name

  it "creates a valid inquiry" do
    # Visit the page containing the new event form
    visit '/inquiries/new'

    # Fill in each input field with the 'inquiry' label
    fill_in "First name", with: "Krystle"
    fill_in "Last name", with: "Bates"
    fill_in "Email", with: "krebates@gmail.com"
    fill_in "Subject", with: "Subject of words"
    fill_in "Description", with: "words that describe"
    click_on "Create Inquiry"
    expect(page).to have_content "words that describe"
  end

  it 'requires a first name' do
    visit '/inquiries/new'
    click_on "Create Inquiry"
    expect(page).to have_content("can't be blank")
  end

  #fill

end
