class CreateVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :variants do |t|
      t.string :url
      t.string :name
      t.string :listing_count
      t.string :low_price
      t.string :market_price

      t.timestamps
    end
  end
end
