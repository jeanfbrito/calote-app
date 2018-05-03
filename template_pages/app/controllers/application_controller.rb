class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #methodo provisorios do devise
  #nao tem devise instalado nesse exemplo
  def current_user
    User.last
  end
end
