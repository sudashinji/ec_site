class EndUsers::AddressesController < ApplicationController
  before_action :authenticate_end_user!

    def index
        @address = Address.new
        @addresses = Address.where(end_user_id: current_end_user.id)
    end

    def create
        @address = Address.new(address_params)
        @address.end_user_id = current_end_user.id
        if @address.save
            redirect_to end_users_addresses_path(current_end_user.id)
        else
            @addresses = Address.all
            render :index
        end
    end

    def address_params
        params.require(:address).permit(:postalcode, :street_address, :address)
    end

end
