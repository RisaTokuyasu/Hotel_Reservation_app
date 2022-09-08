class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.binary :picture
      t.string :name
      t.integer :total
      t.date :strat_date
      t.date :end_date
      t.datetime :start_time

      t.timestamps
    end
  end
end
