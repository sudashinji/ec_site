class EndUsers::OrdersController < ApplicationController
	  before_action :authenticate_end_user!
	def new
		@order = Order.new
		@end_user = EndUser.find(current_end_user.id)
		@addresses = current_end_user.addresses.all
	end


	def confirm
		if session[:order]["payment_method"] == nil || session[:address_btn] == nil
            redirect_to new_end_users_order_path
		end
		
		@order = session[:order]
		@end_user = current_end_user
		@postage = 1000
	    @total_price = 0
	    @prices = 0
	    current_end_user.cart_items.each do |cart_item|
	      price = 0
	      price = cart_item.item.price * cart_item.amount
	      @prices = @prices + cart_item.item.price
	      @total_price = @total_price + price
	    end
	    @prices = (@prices * 1.10).round
	    @total_price = @total_price * 1.10
		@total_price = (@total_price + @postage).round
		@order = Order.new
	end

	def create
		order = Order.new(end_user_id: current_end_user.id,
						  postage: 1000,
						  payment_method: session[:order]["payment_method"],
						  address: session[:order]["address"],
						  postal_code: session[:order]["postal_code"],
						  total_price: params[:order][:total_price],
						  street_address: session[:order]["street_address"]
		                  )
		order.save
		session[:order].clear

		current_end_user.cart_items.each do |cart_item|
			order_detail = OrderDetail.new
			order_detail.item_id = cart_item.item.id
			order_detail.order_id = order.id
			order_detail.amount = cart_item.amount
			order_detail.purchase_price = cart_item.item.price
			order_detail.save
		end

		current_end_user.cart_items.destroy_all


		redirect_to complete_end_users_orders_path
	end


	def excreate

		session[:order] = Order.new(order_params)
		session[:order][:end_user_id] = current_end_user.id
		if params["address_btn"].to_i == 1
		   session[:order]["postal_code"] = current_end_user.postal_code
		   session[:order]["street_address"] = current_end_user.street_address
		   session[:order]["address"] = current_end_user.name
	  
		elsif params["address_btn"].to_i == 2
			address = Address.find(params[:order][:address_info])
			session[:order]["postal_code"] = address.postal_code
			session[:order]["street_address"] = address.street_address
			session[:order]["address"] = address.address
		else   
			address = Address.new(address_params)
			address.end_user_id = current_end_user.id
			address.save

			session[:order]["postal_code"] = address.postal_code
			session[:order]["street_address"] = address.street_address
			session[:order]["address"] = address.address
		end
		
		session[:address_btn] = params[:address_btn]
		session[:order][:end_user_id] = current_end_user.id
		session[:order]["postage"] = 1000
		session[:order]["payment_method"] = order_params[:payment_method]

		redirect_to verification_end_users_orders_path
	end

	def complete
		@order = Order.all
	end

    private
	def address_params
		params.require(:address).permit(:end_user_id, :street_address, :postal_code, :address)
	end

	def confirm_params
		params.require(:order).permit(:end_user_id, :order_status, :total_price, :payment, :postal_code, :postage, :address, :street_address)
	end

	def order_params
		params.require(:order).permit(:end_user_id, :address_btn, :payment, :street_address, :postal_code, :address, :payment_method)
	end

end

