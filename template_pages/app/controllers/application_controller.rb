class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  before_action :authenticate_user!
  respond_to :html, :json, :js
end
