class Admins::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
    def update
        order_detail = OrderDetail.find(params[:id])
        order_detail.update(order_detail_params)

        @order = order_detail.order

		if order_detail.make_status_before_type_cast == 2
		  order_detail.order.update(order_status: 2)
		end

		count = 0
		@order.order_details.each do |order_detail|
		  if order_detail.make_status_before_type_cast == 3
		    count += 1
		  end
		end
		if count == @order.order_details.count
		  @order.update(order_status: 3)
		end

		redirect_to admins_order_path(order_detail.order)
    end

    private
	def order_detail_params
        params.require(:order_detail).permit(:make_status, :amount)
    end
end
