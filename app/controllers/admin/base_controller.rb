class Admin::BaseController < ApplicationController
  # include AdminHelper
  layout "admin"

  before_action :require_admin

  def require_admin
    unless current_admin
      redirect_to new_admin_session_url
    end
  end
end