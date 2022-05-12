class OutpatientClinic < ApplicationRecord
  has_many :providers

  validates_presence_of :name
  validates_presence_of :city
  validates_presence_of :rank
  validates :radiology, inclusion: [true, false]
  validates :pediatrics, inclusion: [true, false]
  validates :womens_health, inclusion: [true, false]
  validates :referrals, inclusion: [true, false]
  validates_presence_of :clinic_services_provided
end
