class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?



	def after_sign_in_path_for(resource)
		case resource
		when Admin
    		admin_items_path(resource)
  		when EndUser
  			public_end_user_path(resource)
  		end
    end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    elsif resource_or_scope == :end_user
      new_end_user_session_path
    else
      root_path
    end
  end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    end
end
