Rails.application.routes.draw do
  # Devise authentication
  devise_for :users

  # Articles
  resources :articles do
    member do
      post :submit
    end
  end

  # Collections
  resources :collections do
    resources :collection_items, only: [:create, :destroy]
  end

  # Admin namespace
  namespace :admin do
    resources :articles, only: [:index, :edit, :update] do
      member do
        post :approve
        post :publish
        post :unpublish
      end
    end
    root to: "articles#index"
  end

  # User profiles
  get "/@:username", to: "profiles#show", as: :profile
  post "/@:username/follow", to: "profiles#follow", as: :follow_profile
  delete "/@:username/unfollow", to: "profiles#unfollow", as: :unfollow_profile

  # Projects (existing)
  resources :projects

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "articles#index"
end
