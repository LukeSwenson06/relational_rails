class Provider < ApplicationRecord
  belongs_to :outpatient_clinic

  validates_presence_of :name
  validates_presence_of :age
  validates :doctor, inclusion: [true, false]
  validates_presence_of :review_rating
end
