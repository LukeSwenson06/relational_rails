require 'rails_helper'

RSpec.describe "specific provider and show attributes ", type: :feature do
  before :each do
    @outpatient_clinics = OutpatientClinic.create!(
      name: "Loveless",
      city: "Albuquerque",
      rank: 25,
      radiology: true,
      pediatrics: true,
      womens_health: true,
      referrals: false,
      clinic_services_provided: 16
    )

    @provider = @outpatient_clinics.providers.create!(
      name: "John Smith",
      age: 23,
      doctor: true,
      review_rating: 4
    )

  end
  it "can show 1 provider by ID and display all attributes" do
  visit "/providers/#{@provider.id}"

  expect(page).to have_content(@provider.name)
  expect(page).to have_content(@provider.age)
  expect(page).to have_content(@provider.doctor)
  expect(page).to have_content(@provider.review_rating)
  end

  it "can take you to the providers index page" do
    visit "/providers/#{@provider.id}"
    click_link("Providers Index")

  expect(current_path).to eq("/providers")
end

it "can take you to each outpatientclinics index page" do
    visit "/providers/#{@provider.id}"
    click_link("Outpatient Clinics Index")

    expect(current_path).to eq("/outpatientclinics")
  end
end
