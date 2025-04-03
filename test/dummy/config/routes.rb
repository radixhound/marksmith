Rails.application.routes.draw do
  get "static/value"
  resources :posts

  root "posts#index"
end
