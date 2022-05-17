require 'rails_helper'

RSpec.describe "Delete OutpatientClinics" do
it "can delete and visit parent page" do
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


  visit "/outpatientclinics/#{clinic_1.id}"

  click_link("Delete Outpatient Clinic")

  visit "/outpatientclinics"

  expect(page).to_not have_content("Loveless")
  end
end
