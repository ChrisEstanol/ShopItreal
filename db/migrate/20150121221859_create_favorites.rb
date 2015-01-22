class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, index: true
      t.references :favorited, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_foreign_key :favorites, :users
  end
end
