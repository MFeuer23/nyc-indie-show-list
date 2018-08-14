class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.integer :venue_id
      t.date :date
      t.string :info
      t.timestamps
    end
  end
end
