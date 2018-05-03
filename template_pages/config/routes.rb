Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "event#index"
  resources :events
  resources :forums
  get "user/my_events", to: "users#events"
end
