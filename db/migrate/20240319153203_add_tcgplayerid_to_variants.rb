class AddTcgplayeridToVariants < ActiveRecord::Migration[7.0]
  def change
    add_column :variants, :tcgplayerid, :string
  end
end
