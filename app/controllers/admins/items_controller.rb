class Admins::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.all
  end

	def show
		@item = Item.find(params[:id])
	end

	def new
		@item = Item.new
	end

	def edit
		@item = Item.find(params[:id])
	end

    def create
		@item = Item.new(item_params)
        if @item.save
		  redirect_to admins_items_path(@item)
		else
			@item = item
			render :new
		end
	end

	def update
		@item = Item.find(params[:id])
		if @item.update(item_params)
	      redirect_to admins_item_path(@item)
	    else
	      render :edit
	    end
	end

	def destroy
		items = Item.find(params[:id])
		if items.destroy
			redirect_to admins_items_path(@item)
	    else
	    	@items = Item.all
	    	render :index
	    end
	end

	private
	def item_params
		params.require(:item).permit(:name, :price, :genre_id, :status, :description, :image)
	end
end
