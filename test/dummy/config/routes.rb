Rails.application.routes.draw do
  mount Marksmith::Engine => "/marksmith"

  resources :posts

  root "posts#index"
end
