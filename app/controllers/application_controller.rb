class ApplicationController < ActionController::Base
	def after_sign_in_path_for(resource)
  		case resource
  			when Admin
    			admins_inquiries_path
    		when end_user
    			publics_inquiry_path(current_end_user)
		end
	end
	def after_sign_out_path_for(resource)
      if resource == :admin
      new_admin_session_path
      else
      new_customer_session_path
      end
    end

end
