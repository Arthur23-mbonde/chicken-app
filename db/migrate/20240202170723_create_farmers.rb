class CreateFarmers < ActiveRecord::Migration[7.1]
  def change
    create_table :farmers do |t|
      t.string :name
      t.string :adress
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
