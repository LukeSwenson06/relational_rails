class AddOutpatientClinicstoProviders < ActiveRecord::Migration[5.2]
  def change
    add_reference :providers, :outpatient_clinic, foreign_key: true
  end
end
