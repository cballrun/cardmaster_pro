class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.string :date
      t.string :condition
      t.string :quantity
      t.string :price
      t.references :variant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
