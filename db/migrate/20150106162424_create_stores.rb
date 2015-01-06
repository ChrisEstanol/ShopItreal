class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.stringdescription :name
      t.references :city, index: true
      t.string :facebook
      t.string :twitter

      t.timestamps null: false
    end
    add_foreign_key :stores, :cities
  end
end
