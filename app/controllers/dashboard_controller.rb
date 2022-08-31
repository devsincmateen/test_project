class DashboardController < ApplicationController
    
    def index
        if !user_signed_in?
            redirect_to (new_user_session_path)
        elsif current_user.admin?
            redirect_to (admin_path)
        elsif current_user.buyer?
            redirect_to (buyer_path)
        end
    end
    
    def admin
    end

    def buyer
    end

end
