class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
	  t.integer :end_user_id
	  t.integer :postage
	  t.integer :payment
	  t.string :address
	  t.integer :order_status, default: 0
	  t.string :postal_code
	  t.integer :total_price
	  t.string :street_address
      t.integer :address_btn
      t.timestamps
    end
  end
end
