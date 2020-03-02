class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		case resource
		when Admin
    		item_path(resource)
  		when EndUser
  			end_user_path(resource)
  		end
    end

    def after_sign_out_path_for(resource)
      # case resource
      # when Admin
      #   new_admin_session_path

      # when EndUser
        new_end_user_session_path
      # end 
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    end
end
