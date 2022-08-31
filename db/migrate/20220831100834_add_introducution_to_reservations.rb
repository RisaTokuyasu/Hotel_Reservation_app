class AddIntroducutionToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :introducution, :string
  end
end
