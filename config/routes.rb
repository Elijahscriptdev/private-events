Rails.application.routes.draw do
  # root "welcome#home"
  resources :sessions
  resources :users
  resources :events
  root 'events#index'

  get "signup", to: "users#new"
  get "signin", to: "sessions#new"
  post 'login', to: 'sessions#create'

  # get  'events', to: 'events#new'
  # post 'events', to: 'events#create'
  # get  'events', to: 'events#show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
