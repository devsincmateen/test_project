# frozen_string_literal: true

Rails.application.routes.draw do
  resources :plans
  devise_for :users
  root to: 'dashboard#index'
  get 'admin', to: 'dashboard#admin'
  get 'buyer', to: 'dashboard#buyer'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
