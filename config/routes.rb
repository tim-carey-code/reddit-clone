Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :subreddits, only: %i[show], path: "/r"

  resources :subreddits, only: %i[index create new edit destroy update]

  resources :subscribers

  get "/r", to: redirect("/subreddits")
end
