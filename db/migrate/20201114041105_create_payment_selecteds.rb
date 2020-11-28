class CreatePaymentSelecteds < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_selecteds do |t|
      t.references :user, null: false, foreign_key: true
      t.string :card_selected, null: false
      t.references :card, foreign_key: true
      t.timestamps
    end
  end
end
