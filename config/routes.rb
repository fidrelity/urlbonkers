Rails.application.routes.draw do

  root 'suggestions#index'

  resources :suggestions, only: [:create]
end
