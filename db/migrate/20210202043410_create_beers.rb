class CreateBeers < ActiveRecord::Migration[6.1]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.string :tasting_notes
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :brewery, null: false, foreign_key: true

      t.timestamps
    end
  end
end
