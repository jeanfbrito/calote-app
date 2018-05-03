class UsersController < ApplicationController
  def events
    @events = current_user.events
  end
end
