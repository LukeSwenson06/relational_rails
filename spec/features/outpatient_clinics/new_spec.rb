require 'rails_helper'

RSpec.describe "Creating new Outpatient Clinics" do
  it "goes to the new page in the outpatient clinics index page " do
    visit '/outpatientclinics'

    click_link('New Outpatient Clinic')

    expect(current_path).to eq("/outpatientclinics/new")

  end

  it "can create a new outpatientclinic" do
    visit '/outpatientclinics/new'

    fill_in('name', with: "Mayo Clinic")
    fill_in('city', with: "Santa Fe")
    fill_in('rank', with: 3)
    fill_in('radiology', with: true)
    fill_in('pediatrics', with: true)
    fill_in('womens_health', with: true)
    fill_in('referrals', with: true)
    fill_in('clinic_services_provided', with: 25)

    click_button("Create Outpatient Clinic")


    expect(current_path).to eq("/outpatientclinics")
    expect(page).to have_content("Mayo Clinic")


  end
end
