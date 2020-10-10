class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.timestamps
      t.text :ingredients
      t.integer :servings_minimum
      t.decimal :price_minimum
      t.string :cover_image
    end
  end
end
