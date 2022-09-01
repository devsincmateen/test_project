# frozen_string_literal: true

# services class for to make controllers skinny
class Services
  def self.go_to_dashboard
    if !user_signed_in?
      redirect_to(new_user_session_path)
    elsif current_user.admin?
      redirect_to(admin_path)
    elsif current_user.buyer?
      redirect_to(buyer_path)
    end
  end
end
