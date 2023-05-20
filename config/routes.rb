# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: %i[create]
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"

  # Api
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index show create destroy] do
        resources :posts, only: %i[index show create destroy] do
          resources :comments, only: %i[index show]
          resources :likes, only: %i[index show]
        end
      end
    end
  end
end
