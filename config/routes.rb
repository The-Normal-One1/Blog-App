# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'

  resources :users do
    resources :posts do
    resources :comments
  end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
