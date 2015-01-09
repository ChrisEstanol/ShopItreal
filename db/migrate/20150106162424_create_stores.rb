class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :description
      t.string :name
      t.references :city, index: true
      t.references :user, index: true
      t.string :facebook
      t.string :twitter

      t.timestamps null: false
    end
    add_foreign_key :stores, :cities
    add_foreign_key :stores, :users
  end
end
