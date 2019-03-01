class AddClientesAndButlerToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :client_id, :integer, foreign_key: true
    add_column :reviews, :butler_id, :integer, foreign_key: true
  end
end
