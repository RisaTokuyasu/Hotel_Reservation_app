class AddIntroductionToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :introducution, :string
  end
end
