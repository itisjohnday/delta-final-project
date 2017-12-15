Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }

  get "/about" => "about#show"
  get "/search" => 'about#search'
  get '/prelim' => 'about#prelim'
  root to: "about#index"

  get "/find_pets" => "find_pets#show"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :pets

  resources :user_profiles do
    resources :media_links
  end

  resources :tournaments do
    resources :rounds do
      resources :matches do
        resources :entries
      end
    end
  end
end
