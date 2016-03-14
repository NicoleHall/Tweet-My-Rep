class CreateZipcodes < ActiveRecord::Migration
  def change
    create_table :zipcodes do |t|
      t.string :postal_code
      t.string :place_name
      t.string :state
      t.string :state_abbreviation
      t.string :county
      t.string :latitude
      t.string :longitude

      t.timestamps null: false
    end
  end
end
