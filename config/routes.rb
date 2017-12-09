Rails.application.routes.draw do
  
  get "/about" => "about#show"

  root to: "about#show"

end