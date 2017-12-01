class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  private
  def authenticate_admin
    if !current_user.admin?
      flash[:alert]="not allow"
      redirect_to root_path
  end
  end

end
