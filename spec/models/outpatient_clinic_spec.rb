require 'rails_helper'

RSpec.describe OutpatientClinic, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :city}
    it { should validate_presence_of :rank}
    it { should validate_presence_of :radiology}
    it { should validate_presence_of :pediatrics}
    it { should validate_presence_of :womens_health}
    it { should validate_presence_of :referrals}
    it { should validate_presence_of :clinic_services_provided}

  end

  describe 'relationships' do
    it { should have_many :providers }
  end
end
