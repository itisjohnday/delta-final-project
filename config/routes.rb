Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }
  
  get "/about" => "about#show"

  root to: "about#show"

  resources :pets

  resources :users do
    resources :media_links
  end
end