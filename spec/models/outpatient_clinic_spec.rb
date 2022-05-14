require 'rails_helper'

RSpec.describe OutpatientClinic, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :city}
    it { should validate_presence_of :rank}
    it { should allow_value(true).for(:radiology)}
    it { should allow_value(true).for(:pediatrics) }
    it { should allow_value(false).for(:womens_health) }
    it { should allow_value(false).for(:referrals) }
    it { should validate_presence_of :clinic_services_provided}

  end

  describe 'relationships' do
    it { should have_many :providers }
  end

  describe 'instance methods' do
    describe '#most_recently_created' do
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
        @clinic_2 = OutpatientClinic.create!(
                                            name: "Medical Zone Clinic",
                                            city: "Dakota",
                                            rank: 13,
                                            radiology: true,
                                            pediatrics: false,
                                            womens_health: true,
                                            referrals: true,
                                            clinic_services_provided: 9
                                    )
        @clinic_3 = OutpatientClinic.create!(
                                            name: "Union Health Clinic",
                                            city: "Albquerque",
                                            rank: 6,
                                            radiology: true,
                                            pediatrics: true,
                                            womens_health: true,
                                            referrals: true,
                                            clinic_services_provided: 22
                                    )


    end

    it "returns most recently created outpatient clinic" do
      expect(OutpatientClinic.most_recently_created.to_a).to eq([@clinic_1, @clinic_2, @clinic_3])
    end
    end
  end
end
