class EndUsers::CartItemsController < ApplicationController
  before_action :authenticate_end_user!

	def index
		@cart_items = current_end_user.cart_items
	end

	def create
		cart_items = CartItem.where(end_user_id: current_end_user.id)
		isExist = false
		id = 0
		cart_items.each do |cart_item|
			if cart_item.item_id == cart_item_params[:item_id].to_i
				isExist = true
				id = cart_item.id
			end
		end

		if isExist
			cart_item = CartItem.find(id)
			sum = cart_item.amount.to_i + cart_item_params[:amount].to_i
			cart_item.update_attributes(amount: sum)
			redirect_to cart_items_path
		else
			cart_item = CartItem.new(cart_item_params)
			cart_item.end_user_id = current_end_user.id
			cart_item.save
			redirect_to cart_items_path
		end
	end

	def update
		cart_item = CartItem.find(params[:id])
		cart_item.update(cart_item_params)
		redirect_to end_users_cart_items_path
	end

	def destroy
		cart_item = CartItem.find(params[:id])
		cart_item.destroy
		redirect_to cart_items_path
	end

	def destroy_all
		CartItem.destroy_all
		redirect_to cart_items_path
	end


	private
	def cart_item_params
      params.require(:cart_item).permit(:end_user_id, :item_id, :amount)
    end
    
end
