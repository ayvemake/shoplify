class AddSalesCountToProduct < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :sales_count, :integer, null: false, default: 0
  end
end