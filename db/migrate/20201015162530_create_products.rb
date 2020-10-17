class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table   :products do |t|
        t.string   :name,                     null: false
        t.text     :detail,                   null: false
        t.integer  :price,                    null: false
        t.integer  :status_id,                null: false
        t.integer  :shipping_cost_id,         null: false
      t.timestamps
    end
  end
end
