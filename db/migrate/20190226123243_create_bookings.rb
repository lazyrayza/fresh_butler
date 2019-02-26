class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
        t.date :start_date
        t.date :end_date
        t.references :client
        t.references :butler
      t.timestamps
    end
    add_foreign_key :bookings, :users, column: :client_id, primary_key: :id
    add_foreign_key :bookings, :users, column: :butler_id, primary_key: :id
  end
end
