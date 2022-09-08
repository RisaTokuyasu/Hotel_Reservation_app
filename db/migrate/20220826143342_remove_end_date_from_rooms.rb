class RemoveEndDateFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :end_date, :date
  end
end
