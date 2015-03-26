class AddCbsIdToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :cbs_id, :integer
  end
end
