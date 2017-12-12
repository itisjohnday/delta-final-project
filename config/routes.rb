Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }

  get "/about" => "about#show"
  root to: "about#index"

  resources :pets

  resources :user_profiles do
    resources :media_links
  end
end 