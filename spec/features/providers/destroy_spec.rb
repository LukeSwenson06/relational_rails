require 'rails_helper'

# User Story 20, Child Delete
#
# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child

RSpec.describe "Delete Providers" do
  it "can delete and visit child index page" do
    Provider.destroy_all
    OutpatientClinic.destroy_all

    clinic_1 = OutpatientClinic.create(
      name: "Loveless",
      city: "Albuquerque",
      rank: 25,
      radiology: true,
      pediatrics: true,
      womens_health: true,
      referrals: false,
      clinic_services_provided: 16
    )

    provider_1 = clinic_1.providers.create!(
      name: "Dr Who",
      age: 1000000000,
      doctor: true,
      review_rating: 1
    )
    provider_2 = clinic_1.providers.create!(
      name: "Dr Strange",
      age: 42,
      doctor: true,
      review_rating: 5
    )
    visit "/providers/#{provider_1.id}"

    click_link "Delete #{provider_1.name}"

    visit "/providers"

    expect(current_path).to eq("/providers")
    expect(page).to_not have_content("Dr Who")
    expect(page).to have_content(42)
    expect(page).to have_content("Dr Strange")
  end
end
