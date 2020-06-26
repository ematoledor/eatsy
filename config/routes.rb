Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :recipes, only: [:index, :show, :new, :create, :order] do
    resources :reviews, only: [:new, :create]
  end
  
  get '/random', to: 'recipes#random'
end


