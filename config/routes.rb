Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  get "/r/:id", to: "subreddits#show", as: :subreddit
  delete "/r/:id", to: "subreddits#destroy"
  patch "/r/:id", to: "subreddits#update"

  resources :subreddits, only: %i[index create new edit] do 
    resources :subscribers 
  end

  get "/r", to: redirect("/subreddits")
end
