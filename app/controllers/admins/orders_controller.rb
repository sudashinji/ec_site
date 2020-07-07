class Admins::OrdersController < ApplicationController
    def index
        @orders = Order.all
    end

    def show
        @order = Order.find(params[:id])
        @order_details = @order.order_details
        @total_price = 0
    end

    def update
        @order = Order.find(params[:id])
        @order.update(order_params)
      
        if @order.order_status_before_type_cast == 1
            @order.order_details.each do |order_detail|
                order_detail.update(make_status: 1) 
            end
        end
        redirect_to admins_order_path(@order.id)
    end

  private
    def order_params
      params.require(:order).permit(:end_user_id, :order_status, :total_price, :payment, :postal_code, :postage, :address, :street_address)
    end
end
