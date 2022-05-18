require 'rails_helper'

RSpec.describe "providers index page", type: :feature do
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
  it "it can show provider and all attributes" do
  visit "/providers"

  expect(page).to have_content(@provider.name)
  expect(page).to have_content(@provider.name)
  expect(page).to have_content(@provider.age)
  expect(page).to have_content(@provider.age)
  expect(page).to have_content(@provider.doctor)
  expect(page).to have_content(@provider.doctor)
  expect(page).to have_content(@provider.review_rating)


  end

  it "can take you to the providers index page" do
    visit "/providers"
    click_link("Providers Index")

    expect(current_path).to eq("/providers")
  end

  it "can take you to each outpatientclinics index page" do
    visit "/providers"
    click_link("Outpatient Clinics Index")

    expect(current_path).to eq("/outpatientclinics")
  end

  it "only shows the doctors on the index page" do
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
    provider_1 = clinic_1.providers.create!(
      name: "Aaron Uppercut",
      age: 27,
      doctor: true,
      review_rating: 5
    )
    provider_2 = clinic_1.providers.create!(
      name: "Stephen Strange ",
      age: 42,
      doctor: true,
      review_rating: 5
    )
    provider_3 = clinic_1.providers.create!(
      name: "Dr Who",
      age: 1000000000,
      doctor: false,
      review_rating: 1
    )
    visit "/providers"

    expect(page).to have_content("Stephen Strange")
    expect(page).to have_content("Aaron Uppercut")
    expect(page).to have_content(27)
    expect(page).to_not have_content("Dr.Who")
    expect(page).to_not have_content(1000000000)
  end

  it "can take you to a link to edit provider" do
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

    provider_1 = clinic_1.providers.create!(
      name: "Jane Doe",
      age: 27,
      doctor: true,
      review_rating: 5
    )
    visit '/providers'
    click_link("Edit #{provider_1.name}")

    expect(current_path).to eq("/providers/#{provider_1.id}/edit")
  end

  it "it can delete the provider" do
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

    provider_1 = clinic_1.providers.create!(
      name: "Jane Doe",
      age: 27,
      doctor: true,
      review_rating: 5
    )
    provider_2 = clinic_1.providers.create!(
      name: "Dr Who",
      age: 1000000000,
      doctor: true,
      review_rating: 1
    )
    visit '/providers'
    click_link("Delete #{provider_1.name}")

    expect(current_path).to eq("/providers")

    expect(page).to_not have_content("Jane Doe")
    expect(page).to_not have_content(5)
    expect(page).to have_content("Dr Who")
    expect(page).to have_content(1000000000)
  end
end
