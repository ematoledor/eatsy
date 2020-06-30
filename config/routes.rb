Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :recipes, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create, :index]
  end

  get '/random', to: 'recipes#random'
  get 'recipes/:id/instruction', to: 'recipes#instruction', as: :instruction
  get '/accountsummary', to: 'recipes#accountsummary'
  get 'recipes/:id/order', to: 'recipes#order', as: :order
  
end


