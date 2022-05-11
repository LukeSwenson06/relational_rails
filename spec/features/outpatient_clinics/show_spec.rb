require 'rails_helper'

RSpec.describe "outpatient clinics show page", type: :feature do
  it "can see the outpatient clinics attributes" do
    clinic_1 = OutpatientClinic.create( name: "Loveless",
                                        city: "Albuquerque",
                                        rank: 25,
                                        radiology: true,
                                        pediatrics: true,
                                        womens_health: true,
                                        referrals: false,
                                        clinic_services_provided: 16
                                      )

    visit "/outpatientclinics/#{clinic_1.id}"

  expect(page).to have_content(clinic_1.name)
  expect(page).to have_content(clinic_1.city)
  expect(page).to have_content(clinic_1.rank)
  expect(page).to have_content(clinic_1.radiology)
  expect(page).to have_content(clinic_1.pediatrics)
  expect(page).to have_content(clinic_1.womens_health)
  expect(page).to have_content(clinic_1.referrals)
  expect(page).to have_content(clinic_1.clinic_services_provided)

  end
end
