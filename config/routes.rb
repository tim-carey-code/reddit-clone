Rails.application.routes.draw do
  root "home#index"

  resources :subreddits, only: %i[show], path: "/r"

  resources :subreddits, only: %i[index edit create new update destroy]

  get "/r", to: redirect('/subreddits')
end
