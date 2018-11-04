class Manage::BaseController < ApplicationController
  # include ManageHelper
  layout "manage"

  before_action :require_manage
  before_action :load_company

  def load_company
    @company = current_manage.company if current_manage
  end

  def require_manage
    unless current_manage
      redirect_to new_manage_session_url
    end
  end
end