require 'rails_helper'

RSpec.describe "providers index page", type: :feature do

  it "it can show provider and all attributes" do
    outpatient_clinics = OutpatientClinic.create!(
                                        name: "Loveless",
                                        city: "Albuquerque",
                                        rank: 25,
                                        radiology: true,
                                        pediatrics: true,
                                        womens_health: true,
                                        referrals: false,
                                        clinic_services_provided: 16
                                )

    provider = outpatient_clinics.providers.create!(
                                  name: "John Smith",
                                  age: 23,
                                  doctor: true,
                                  review_rating: 4
                                )
  visit "/providers"
  save_and_open_page
  expect(page).to have_content(provider.name)
  expect(page).to have_content(provider.age)
  expect(page).to have_content(provider.doctor)
  expect(page).to have_content(provider.review_rating)


  end
end
