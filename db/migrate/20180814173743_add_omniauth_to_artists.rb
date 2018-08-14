class AddOmniauthToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :provider, :string
    add_column :artists, :uid, :string
  end
end
