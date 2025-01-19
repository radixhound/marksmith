Marksmith::Engine.routes.draw do
  resources :markdown_previews, only: [:create]
end
