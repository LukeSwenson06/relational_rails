# User Story 5, Parent Children Index
#
# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes:

require 'rails_helper'

RSpec.describe "Outpatient Clinics Providers index" do
  it "shows all of the attributes of the providers for the outpatient clinics" do
    clinic = OutpatientClinic.create!(
                              name: "Loveless",
                              city: "Albuquerque",
                              rank: 25,
                              radiology: true,
                              pediatrics: true,
                              womens_health: true,
                              referrals: false,
                              clinic_services_provided: 16
                            )
    provider_1 = clinic.providers.create!(
                              name: "John Smith",
                              age: 23,
                              doctor: true,
                              review_rating: 4
                            )
    provider_2 = clinic.providers.create!(
                              name: "Jane Doe",
                              age: 34,
                              doctor: true,
                              review_rating: 5
                            )
    visit "/outpatientclinics/#{clinic.id}/providers"

  expect(page).to have_content(provider_1.name)
  expect(page).to have_content(provider_1.age)
  expect(page).to have_content(provider_1.doctor)
  expect(page).to have_content(provider_1.review_rating)
  expect(page).to have_content(provider_2.name)
  expect(page).to have_content(provider_2.age)
  expect(page).to have_content(provider_2.doctor)
  expect(page).to have_content(provider_2.review_rating)
  end
end
