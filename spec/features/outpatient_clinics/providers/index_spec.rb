require 'rails_helper'

RSpec.describe "Outpatient Clinics Providers index" do
  before :each do

  @clinic = OutpatientClinic.create!(
    name: "Loveless",
    city: "Albuquerque",
    rank: 25,
    radiology: true,
    pediatrics: true,
    womens_health: true,
    referrals: false,
    clinic_services_provided: 16
  )
  @provider_1 = @clinic.providers.create!(
    name: "John Smith",
    age: 23,
    doctor: true,
    review_rating: 4
  )
  @provider_2 = @clinic.providers.create!(
    name: "Jane Doe",
    age: 34,
    doctor: true,
    review_rating: 5
  )
  end
  it "shows all of the attributes of the providers for the outpatient clinics" do
      visit "/outpatientclinics/#{@clinic.id}/providers"

      expect(page).to have_content(@provider_1.name)
      expect(page).to have_content(@provider_1.age)
      expect(page).to have_content(@provider_1.doctor)
      expect(page).to have_content(@provider_1.review_rating)
      expect(page).to have_content(@provider_2.name)
      expect(page).to have_content(@provider_2.age)
      expect(page).to have_content(@provider_2.doctor)
      expect(page).to have_content(@provider_2.review_rating)

  end

  it "can take you to each outpatientclinics index page" do
    visit "/outpatientclinics/#{@clinic.id}/providers"
    click_link("Outpatient Clinics Index")
    expect(current_path).to eq("/outpatientclinics")

  end

  it "can take you to the providers index page" do
    visit "/outpatientclinics/#{@clinic.id}/providers"
    click_link("Providers Index")

    expect(current_path).to eq("/providers")
  end

  it "can alphabetize index page by clicking link " do
    visit "/outpatientclinics/#{@clinic.id}/providers"

    click_link("Sort Providers")

    expect(current_path).to eq("/outpatientclinics/#{@clinic.id}/providers")
  end
end
