Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :subreddits, only: %i[show edit destroy update], path: "/r"

  resources :subreddits, only: %i[index create new]

  get "/r", to: redirect("/subreddits")
end
