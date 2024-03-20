class AddRarityToVariants < ActiveRecord::Migration[7.0]
  def change
    add_column :variants, :rarity, :string
  end
end
