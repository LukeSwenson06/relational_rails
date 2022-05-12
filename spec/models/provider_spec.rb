require 'rails_helper'

RSpec.describe Provider, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :age}
    it { should validate_presence_of :doctor}
    it { should validate_presence_of :review_rating}
  end

  describe 'relationships' do
    it { should belong_to :outpatient_clinic }
  end
end
