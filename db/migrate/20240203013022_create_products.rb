class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :current_price
      t.string :disponibility
      t.text :evaluation
      t.references :race, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
