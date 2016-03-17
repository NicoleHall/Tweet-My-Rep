class AddEmailToLegislators < ActiveRecord::Migration
  def change
    add_column :legislators, :email, :string
  end
end
