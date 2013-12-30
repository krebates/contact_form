require 'spec_helper'

feature "admin deletes an inquiry on the page" do

  # As an admin
  # I want to delete an inquiry
  # So that I can remove spam or other undesirable inquiries
  # Acceptance Criteria:

  # I can remove an item from the listing of contact inquiries

  it "deletes an inquiry" do
  Inquiry.create!(first_name: "Harry", last_name: "Potter", email: "b@witch.com", subject: "As If", description: "llllllllll")
  visit '/inquiries'
  expect(Inquiry.all.count).to eql(1)
  click_on 'Delete information'
  expect(Inquiry.all.count).to eql(0)
  end
end
