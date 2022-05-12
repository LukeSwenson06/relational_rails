class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :name
      t.integer :age
      t.boolean :doctor
      t.integer :review_rating

      t.timestamps
    end
  end
end
