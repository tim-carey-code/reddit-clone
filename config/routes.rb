Rails.application.routes.draw do
  resources :subreddits, path: "/r"
  root "home#index"
end
