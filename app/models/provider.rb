class Provider < ApplicationRecord
  belongs_to :outpatient_clinic

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :doctor
  validates_presence_of :review_rating
end
