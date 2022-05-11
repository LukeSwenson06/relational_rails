require 'rails_helper'

RSpec.describe "outpatient clinics index page", type: :feature do
#   For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
  it "can see each outpatient clinic and display it" do
    clinic_1 = OutpatientClinic.create( name: "Loveless",
                                        city: "Albuquerque",
                                        rank: 25,
                                        radiology: true,
                                        pediatrics: true,
                                        womens_health: true,
                                        referrals: false,
                                        clinic_services_provided: 16
                                      )
    clinic_2 = OutpatientClinic.create( name: "General",
                                        city: "Albuquerque",
                                        rank: 18,
                                        radiology: false,
                                        pediatrics: false,
                                        womens_health: false,
                                        referrals: true,
                                        clinic_services_provided: 6
                                      )
 visit "/outpatientclinics"

 expect(page).to have_content(clinic_1.name)
 expect(page).to have_content(clinic_2.name)


  end
end
