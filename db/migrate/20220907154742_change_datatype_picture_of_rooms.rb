class ChangeDatatypePictureOfRooms < ActiveRecord::Migration[6.1]
  def change
    change_column :rooms, :picture, :string
  end
end
