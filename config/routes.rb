Rails.application.routes.draw do
  root 'map_pages#top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[new create]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :crossings, only: %i[show] do
    resources :posts, only: %i[new create show edit update destroy]
  end
end
