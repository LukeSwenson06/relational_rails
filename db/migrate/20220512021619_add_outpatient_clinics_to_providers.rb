class AddOutpatientClinicsToProviders < ActiveRecord::Migration[5.2]
  def change
    add_reference :providers, :outpatient_clinics, foreign_key: true
  end
end
