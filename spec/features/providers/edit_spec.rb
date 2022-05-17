require 'rails_helper'

RSpec.describe "Provider edit" do
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

  it "can click the link to edit" do
    visit "/providers/#{@provider.id}"

    expect(page).to have_content("John Smith")
    expect(page).to have_content(23)
    expect(page).to have_content(4)

    click_link("Update Provider")

    visit "/providers/#{@provider.id}/edit"

    fill_in("name", with: "Debra Jenkins")
    fill_in("age", with: 23)
    fill_in("doctor", with: true)
    fill_in("review_rating", with: 3)

    click_button "Update Provider"

    expect(current_path).to eq("/providers/#{@provider.id}")
    expect(page).to have_content("Debra Jenkins")
    expect(page).to have_content(23)
    expect(page).to have_content(3)
    expect(page).to_not have_content("John Smith")
    expect(page).to_not have_content(4)

  end
end
