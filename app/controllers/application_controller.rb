class ApplicationController < ActionController::Base
  include Authentication

  before_action :current_user
  helper_method :current_user
  helper_method :user_signed_in?
end
