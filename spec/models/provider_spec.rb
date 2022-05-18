require 'rails_helper'

RSpec.describe Provider, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should allow_value(true).for :doctor }
    it { should validate_presence_of :review_rating }
  end

  describe 'relationships' do
    it { should belong_to :outpatient_clinic }
  end

  describe 'instance methods' do
    describe '#true_records' do
      it "can return only true doctors" do

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

      expect(Provider.true_records).to eq([provider_1, provider_2])
      end
    end

    describe '#alphabetize_providers' do
      it "can alphabetize all providers" do
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
          doctor: true,
          review_rating: 1
        )

      expect(Provider.alphabetize_providers).to eq([provider_1, provider_3, provider_2])
      end

    describe '#filter_providers_doctors' do
      it "returns only doctors with a review rating higher then output" do
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
                                              name: "John Smith",
                                              age: 23,
                                              doctor: true,
                                              review_rating: 4
                                      )
          provider_2 = clinic_1.providers.create!(
                                              name: "Jane Doe",
                                              age: 27,
                                              doctor: true,
                                              review_rating: 5
                                      )

          provider_3 = clinic_1.providers.create!(
                                              name: "Dr Strange",
                                              age: 42,
                                              doctor: true,
                                              review_rating: 5
                                      )
        expect(Provider.filter_reviews(4)).to eq([provider_2, provider_3])
        end
      end
    end
  end
end
