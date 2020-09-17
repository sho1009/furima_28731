class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :explanation
      t.integer :genre_id
      t.integer :status_id
      t.integer :burden_id
      t.integer :area_id
      t.integer :days_id
      t.integer :value
      t.references :user
      t.timestamps
    end
  end
end
