Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :recipes, only: ['show', 'index', 'create', 'order', 'random']
  get '/random', to: 'recipes#random'
end


