class ChangeColumnNameOnLegislatorsFromTwitterHandleToTwitterId < ActiveRecord::Migration
  def change
    rename_column :legislators, :twitter_handle, :twitter_id
  end
end
