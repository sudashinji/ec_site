class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

     def after_sign_in_path_for(resource)
         case resource
	         when Admin
	             admins_items_path
	         when EndUser
	             end_users_path
         end
     end

    def after_sign_out_path_for(resource_or_scope)
        if resource_or_scope == Admin
            new_admin_session_path
        else
            new_end_user_session_path
        end
    end



    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :first_name_kana,:last_name, :last_name_kana, :postal_code, :address, :phone_number])
        devise_parameter_sanitizer.permit(:sign_in, keys:[:email])
    end
end
