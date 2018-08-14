class Remove < ActiveRecord::Migration[5.2]
  def change
    remove_column :artists, :user_name
    remove_column :artists, :password_digest
  end
end
