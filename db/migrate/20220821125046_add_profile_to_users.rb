class AddProfileToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :profile, :text #追記
  end
end
