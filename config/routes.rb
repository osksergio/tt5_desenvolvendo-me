Rails.application.routes.draw do
  resources :lectures
  resources :tracks
  resources :conferences
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
