Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :posts
  resources :users, only: [:create]

  namespace :users do
    resources :sessions, only: [:create, :destroy]
  end

  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  get 'signup', to: 'users#sign_up'
  get 'signup/caterer', to: 'users#new_caterer'
end
