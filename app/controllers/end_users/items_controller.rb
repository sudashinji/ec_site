class EndUsers::ItemsController < ApplicationController

	def index
		@items = Item.all
	end

	def show
		@item = Item.find(params[:id])
		@cart_item = CartItem.new
	end

    private
	def item_params
	    params.require(:item).permit(:name, :price, :genre_id, :status, :description, :image)
	end
end


