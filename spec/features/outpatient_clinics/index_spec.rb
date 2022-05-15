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

    visit "/outpatientclinics"
    expect(page).to have_content(@clinic_1.created_at)
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
end
