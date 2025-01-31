Rails.application.routes.draw do
  root 'map_pages#top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[new create]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resource :profile, only: %i[edit show update]
  
  post 'oauth/callback' => 'oauths#callback'
  get 'oauth/callback' => 'oauths#callback'
  get 'oauth/:provider' => 'oauths#oauth', :as => :auth_at_provider

  resources :password_resets, only: %i[new create edit update]
  resources :contacts, only: %i[new create]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  resources :posts, only: %i[index]

  resources :crossings, only: %i[show] do
    resources :posts, only: %i[new create show edit update destroy] do
      resources :comments, only: %i[create edit destroy]
      collection do
        get :favorites
      end
    end
  end
  resources :favorites, only: %i[create destroy]  
end
