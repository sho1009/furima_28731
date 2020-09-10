class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :explanation
      t.integer :category
      t.integer :condition
      t.integer :postage_type
      t.integer :prefectures
      t.integer :preparation_days
      t.integer :value
      t.references :user
      t.timestamps
    end
  end
end
