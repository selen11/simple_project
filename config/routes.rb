Rails.application.routes.draw do
  root 'flash_cards#index'
  resources :flash_cards, only: :index
end
