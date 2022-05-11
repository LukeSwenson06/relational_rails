class CreateOutpatientClinics < ActiveRecord::Migration[5.2]
  def change
    create_table :outpatient_clinics do |t|
      t.string :name
      t.string :city
      t.integer :rank
      t.boolean :radiology
      t.boolean :pediatrics
      t.boolean :womens_health
      t.boolean :referrals
      t.integer :clinic_services_provided
      t.timestamps
    end
  end
end
