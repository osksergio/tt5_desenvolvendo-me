Rails.application.routes.draw do
  resources :lectures
  resources :tracks
  resources :conferences
  post 'imp_lec', to: 'lectures#import_lectures'
end
