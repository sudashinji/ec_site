class Admins::ItemsController < ApplicationController


  def index
  	@search_items = @search.result
    @items = Item.all
  end

	def show
		@item = Item.find(params[:id])
		@genre = @item.genre
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
		  redirect_to admins_item_path(@item)
		else
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
