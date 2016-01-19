class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
      t.string :twitter_handle
      t.string :first_name
      t.string :last_name
    end
  end
end
