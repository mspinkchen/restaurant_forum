class Admin::BaseController < ApplicationController
  before_action :authenticate_user!

  private
  def authenticate_admin
    if !current_user.admin?
      flash[:alert]="not allow"
      redirect_to root_path
    end
  end


end