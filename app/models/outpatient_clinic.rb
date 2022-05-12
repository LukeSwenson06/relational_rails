class OutpatientClinic < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :city
  validates_presence_of :rank
  validates_presence_of :radiology
  validates_presence_of :pediatrics
  validates_presence_of :womens_health
  validates_presence_of :referrals
  validates_presence_of :clinic_services_provided

end
