class RemoveStratDateFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :strat_date, :date
  end
end
