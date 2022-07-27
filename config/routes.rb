Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  get "/r/:id", to: "subreddits#show", as: :subreddit
  delete "/r/:id", to: "subreddits#destroy"
  patch "/r/:id", to: "subreddits#update"

  resources :subreddits do
    resources :subscriptions
  end

  get "/r", to: redirect("/subreddits")
end
