class AddIdPathToPaymentSelecteds < ActiveRecord::Migration[6.0]
  def change
    add_column :payment_selecteds, :id_path, :string
  end
end
