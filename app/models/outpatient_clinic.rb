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


 def self.most_recently_created
  order(:created_at)
 end

 def provider_assoc_count
   self.providers.count(:id)
 end
end
