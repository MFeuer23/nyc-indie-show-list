class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :artist_id
      t.integer :show_id
      t.string :booking_contact
      t.timestamps
    end
  end
end
