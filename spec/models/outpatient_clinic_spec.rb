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
end
