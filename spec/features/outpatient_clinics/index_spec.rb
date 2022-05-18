require 'rails_helper'

RSpec.describe "outpatient clinics index page", type: :feature do
  before :each do
    @clinic_1 = OutpatientClinic.create!( name: "Loveless",
      city: "Albuquerque",
      rank: 25,
      radiology: true,
      pediatrics: true,
      womens_health: true,
      referrals: false,
      clinic_services_provided: 16
    )
    @clinic_2 = OutpatientClinic.create!( name: "General",
      city: "Albuquerque",
      rank: 18,
      radiology: false,
      pediatrics: false,
      womens_health: false,
      referrals: true,
      clinic_services_provided: 6
    )

  end
  it "can see each outpatient clinic and display it" do

    visit "/outpatientclinics"

    expect(page).to have_content(@clinic_1.name)
    expect(page).to have_content(@clinic_2.name)
  end

  it "has the last created at data" do
    Provider.destroy_all
    OutpatientClinic.destroy_all

    clinic_1 = OutpatientClinic.create!( name: "Loveless",
      city: "Albuquerque",
      rank: 25,
      radiology: true,
      pediatrics: true,
      womens_health: true,
      referrals: false,
      clinic_services_provided: 16
    )

    visit "/outpatientclinics"

    expect(page).to have_content(clinic_1.created_at)
  end

  it "can take you to the providers index page" do
    visit "/outpatientclinics/"

    click_link("Providers Index")
  expect(current_path).to eq("/providers")

  end

  it "can take you to the providers index page" do
    visit '/outpatientclinics'
    click_link("Providers Index")
  expect(current_path).to eq("/providers")
  end

  it "it can take you to the edit page" do
    Provider.destroy_all
    OutpatientClinic.destroy_all

    clinic_1 = OutpatientClinic.create!( name: "Loveless",
      city: "Albuquerque",
      rank: 25,
      radiology: true,
      pediatrics: true,
      womens_health: true,
      referrals: false,
      clinic_services_provided: 16
    )

    visit '/outpatientclinics'
    click_link("Edit #{clinic_1.name}")

    expect(current_path).to eq("/outpatientclinics/#{clinic_1.id}/edit")
  end

  it "it will delete the Outpatient Clinic" do
    Provider.destroy_all
    OutpatientClinic.destroy_all

    clinic_1 = OutpatientClinic.create!(
      name: "Loveless",
      city: "Albuquerque",
      rank: 25,
      radiology: true,
      pediatrics: true,
      womens_health: true,
      referrals: false,
      clinic_services_provided: 16
    )

    clinic_2 = OutpatientClinic.create!(
      name: "Space Station Health",
      city: "Space",
      rank: 80000,
      radiology: false,
      pediatrics: false,
      womens_health: false,
      referrals: false,
      clinic_services_provided: 1
    )

    visit '/outpatientclinics'
    click_link("Delete #{clinic_1.name}")
    expect(current_path).to eq("/outpatientclinics")

    expect(page).to_not have_content("Loveless")
    expect(page).to_not have_content(25)
    expect(page).to_not have_content(16)
    expect(page).to have_content("Space Station Health")
    expect(page).to have_content(1)
  end
end
