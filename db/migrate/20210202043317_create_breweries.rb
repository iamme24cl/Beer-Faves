class CreateBreweries < ActiveRecord::Migration[6.1]
  def change
    create_table :breweries do |t|
      t.string :name
      t.boolean :in_store

      t.timestamps
    end
  end
end
