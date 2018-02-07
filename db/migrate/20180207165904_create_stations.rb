class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :name
      t.string :address
      t.string :fuel_types
      t.float :distance
      t.datetime :access_times
    end
  end
end
