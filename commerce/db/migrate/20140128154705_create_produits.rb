class CreateProduits < ActiveRecord::Migration
  def change
    create_table :produits do |t|
      t.string :nom
      t.string :description
      t.decimal :prix
      t.string :image

      t.timestamps
    end
  end
end
