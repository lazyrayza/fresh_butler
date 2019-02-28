class ChangeButlerToDefaultFalseInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :butler, :boolean, default: false
  end
end
