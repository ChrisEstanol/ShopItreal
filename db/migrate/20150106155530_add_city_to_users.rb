class AddCityToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :city, index: true
    add_foreign_key :users, :cities
  end
end
