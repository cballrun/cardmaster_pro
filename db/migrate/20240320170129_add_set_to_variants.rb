class AddSetToVariants < ActiveRecord::Migration[7.0]
  def change
    add_column :variants, :set, :string
  end
end
