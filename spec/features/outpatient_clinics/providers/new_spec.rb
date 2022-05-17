require 'rails_helper'

RSpec.describe "Providers Creation" do
  before :each do
  @clinic_1 = OutpatientClinic.create!(
    name: "Loveless",
    city: "Albuquerque",
    rank: 25,
    radiology: true,
    pediatrics: true,
    womens_health: true,
    referrals: false,
    clinic_services_provided: 16
  )

  @provider = @clinic_1.providers.create!(
    name: "John Smith",
    age: 23,
    doctor: true,
    review_rating: 4
  )
end
  it "goes to a new page in the providers index" do
    visit "/outpatientclinics/#{@clinic_1.id}/providers"

    click_link('Create New Provider')
    expect(current_path).to eq("/outpatientclinics/#{@clinic_1.id}/providers/new")

  end

  it "can create a new provider" do
    visit "/outpatientclinics/#{@clinic_1.id}/providers/new"

    fill_in('name', with: "Billy Bob")
    fill_in('age', with: 34 )
    fill_in('doctor', with: true)
    fill_in('review_rating', with: 4)

    click_button("Create Provider")

    expect(current_path).to eq("/outpatientclinics/#{@clinic_1.id}/providers")
    expect(page).to have_content("Billy Bob")
    expect(page).to have_content(34)
    expect(page).to have_content(4)

  end
end
