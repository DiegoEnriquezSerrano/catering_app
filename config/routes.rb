Rails.application.routes.draw do
  devise_for :users,
              path: '',
              path_names: {
                sign_in: 'login',
                sign_out: 'logout',
                registration: 'signup'
              },
              controllers: { 
                registrations: 'users/registrations',
                sessions: 'users/sessions'
              }
  resources :posts
  resources :users, only: [:create]
  resources :meals

  namespace :users do
    resources :sessions, only: [:create, :destroy]
  end

  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  get 'signup', to: 'users#sign_up'
  get 'signup/caterer', to: 'users#sign_up_caterer'
  get 'sign_in', to: 'users#login'
  get 'home', to: 'welcome#index'
  get 'caterers', to: 'users#caterers'
end
