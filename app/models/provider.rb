class Provider < ApplicationRecord
  belongs_to :outpatient_clinic

  validates_presence_of :name
  validates_presence_of :age
  validates :doctor, inclusion: [true, false]
  validates_presence_of :review_rating

  def self.true_records
    where("doctor = true")
  end

  def self.alphabetize_providers
    order(:name)
  end


  def self.filter_reviews(number)
    where('review_rating > ?', number)
  end
end
