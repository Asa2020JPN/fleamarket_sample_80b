class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name,                           null: false
      t.references :product, foreign_key: true,  null: false
      t.timestamps
    end
  end
end
