class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :condition
      t.string :seller
      t.string :price
      t.references :variant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
