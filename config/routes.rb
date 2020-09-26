Rails.application.routes.draw do
  devise_for :users
  resources :posts
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  get 'signup', to: 'users#new'
  get 'signup/caterer', to: 'users#new_caterer'
end
