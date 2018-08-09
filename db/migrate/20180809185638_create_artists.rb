class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :user_name
      t.string :password_digest
      t.string :name
      t.string :bio
      t.string :genre
      t.timestamps
    end
  end
end
