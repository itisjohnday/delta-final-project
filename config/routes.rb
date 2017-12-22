Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }

  root to: "about#index"

  get "/about" => "about#show"
  get "/search" => 'about#search'
  get '/prelim/:id' => 'about#prelim'
  get '/dummyjson' => 'about#dummyjson'
  get "/get_links" => "about#return_links"
  get "/no_entries" => "about#no_entries"
  get "/match_frame" => "about#match_frame"
  post "/vote_reg" => "about#vote_reg"
  get 'bracket/:id' => 'about#bracket'
  get '/current_scores/:id' => 'about#current_scores'


  post "/tournaments/:tournament_id/set_next_round" => "rounds#set_new_round"
  get "/tournaments/:id/reset" => 'tournaments#reset'
  get "/tournaments/:id/enter" => 'tournaments#enter'
  post "/tournaments/:id/enter_return" => 'tournaments#enter_return'
  get '/tournaments/:id/winner' => 'tournaments#winner'

  get "/find_pets" => "find_pets#index"

  get "/get_links" => "about#return_links"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :pets


  resources :user_profiles do
    resources :media_links do
      resources :comments
    end
  end

  resources :tournaments do
    resources :rounds do
      resources :matches do
        resources :entries
      end
    end
  end
end
