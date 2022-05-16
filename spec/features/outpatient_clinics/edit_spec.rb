require 'rails_helper'

RSpec.describe "Update Outpatient Clinics info" do
  it "links to the edit page" do
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
    visit "/outpatientclinics/#{clinic.id}"

    click_link "Update Outpatient Clinics"

    expect(current_path).to eq("/outpatientclinics/#{clinic.id}/edit")
  end

  it "can edit the outpatient clinic" do
    clinic = OutpatientClinic.create!(
      name: "Gunter",
      city: "Ruidoso",
      rank: 13,
      radiology: false,
      pediatrics: true,
      womens_health: true,
      referrals: true,
      clinic_services_provided: 12
    )
    visit "/outpatientclinics/#{clinic.id}"

    expect(page).to have_content("Gunter")
    expect(page).to have_content(13)
    expect(page).to have_content(12)

    click_link("Update Outpatient Clinics")


    visit "/outpatientclinics/#{clinic.id}/edit"

    fill_in("name", with: "Cleveland Clinic")
    fill_in("city", with: "Pagosa Springs")
    fill_in("rank", with: 2)
    fill_in("radiology", with: true)
    fill_in("pediatrics", with: true)
    fill_in("womens_health", with: true)
    fill_in("referrals", with: true)
    fill_in("clinic_services_provided", with: true)

    click_button "Update"

    expect(current_path).to eq("/outpatientclinics/#{clinic.id}")
    expect(page).to have_content("Cleveland Clinic")
    expect(page).to have_content("Pagosa Springs")
    expect(page).to have_content(2)

  end
end
