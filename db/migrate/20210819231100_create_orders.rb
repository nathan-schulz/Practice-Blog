class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.date :ordered_date
      t.decimal :total_price

      t.timestamps
    end
  end
end
