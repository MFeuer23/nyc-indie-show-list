class AddArtistIdToShows < ActiveRecord::Migration[5.2]
  def change
    add_column :shows, :artist_id, :integer
  end
end
