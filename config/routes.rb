Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }

  get "/about" => "about#show"

  get "/user_profile", to: 'user_profile#index'
  get '/user_pets', to: 'user_profile#user_pets'
  get '/user_info', to: 'user_profile#user_info'

  root to: "about#show"

  resources :pets

  resources :users do
    resources :media_links
  end

end
