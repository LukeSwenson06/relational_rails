require 'rails_helper'

# User Story 11, Parent Creation
#
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

RSpec.describe "Creating new Outpatient Clinics" do
  it "goes to the new page in the outpatient clinics index page " do
    visit '/outpatientclinics'

    click_link('New Outpatient Clinic')
    expect(current_path).to eq("/outpatientclinics/new")

  end
end
