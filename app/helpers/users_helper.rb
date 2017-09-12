module UsersHelper
	  def admin_user
    unless @current_user.admin?
      redirect_to(@current_user)
    end
  end
end
