class ApplicationController < ActionController::Base
	def after_sign_in_path_for(resource)
  		case resource
  			when Admin
    			admins_end_users_path
		end
	end

	def after_sign_out_path_for(resource)
      if resource == :admin
      new_admin_session_path
      else
      new_end_user_session_path
      end
    end
end
