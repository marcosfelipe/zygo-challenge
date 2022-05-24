class CreateFavoriteBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_books do |t|
      t.references :user
      t.references :book
      t.timestamps
    end
  end
end
