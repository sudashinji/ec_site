class Admins::EndUsersController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@end_users = EndUser.with_deleted
  end
  def edit
  	@end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      redirect_to admins_end_users_path 
    else
      render :edit
    end
  end
    private
  def end_user_params
      params.require(:end_user).permit(:email, :first_name, :last_name, :first_name_kana,:last_name_kana, :postal_code, :address, :phone_number)
  end
end
