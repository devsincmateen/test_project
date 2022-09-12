# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  root to: 'dashboard#show'
  resource :dashboard, only: [:show]
  resources :plans do
    collection { get 'myplans' }
    resources :features
    resources :subscriptions
  end

  # get 'admin', to: 'dashboard#admin'
  # get 'buyer', to: 'dashboard#buyer'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
