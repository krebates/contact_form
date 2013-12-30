require 'spec_helper'

feature "admin visits the inquiries page" do
  # As an admin
  # I want to review contact inquiries
  # So that I can respond or take action
  # Acceptance Criteria:

  # I can see a list of all contact inquiries

  it "sees a header" do
    visit '/inquiries'
    expect(page).to have_content "Welcome!"
  end

  it "sees all the inquiries listed on the page" do
  # Create two inquiries so we can test that they're displayed on the page
  inquiry1 = Inquiry.create!(first_name: "Krystle", last_name: "Bates", email: "krebates@gmail.com", subject: "Cool subject bro", description: "kdjklajlkfjdlkjlkafjdlja")
  inquiry2 = Inquiry.create!(first_name: "Harry", last_name: "Potter", email: "b@witch.com", subject: "As If", description: "llllllllll")

  visit '/inquiries'

  # We expect to see event1's location on the page
  expect(page).to have_content inquiry1.first_name, inquiry1.last_name, inquiry1.email, inquiry1.subject, inquiry1.description
  # We expect to see event2's location on the page
  expect(page).to have_content inquiry2.first_name, inquiry2.last_name, inquiry2.email, inquiry2.subject, inquiry2.description
  end
end
