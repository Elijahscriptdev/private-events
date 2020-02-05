Rails.application.routes.draw do
  root "welcome#home"
  resources :sessions
  resources :users

  get "signup", to: "users#new"
  get "signin", to: "sessions#new"
  post 'login', to: 'sessions#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
