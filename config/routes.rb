LiveBaike::Application.routes.draw do
  get "device_infos/index"

  get "device_infos_controller/index"

  require 'api'
  
  devise_for :users

  # namespace :api do
  #   namespace :v1 do
  #     resources :categories, :only => [:index, :create], :format => :json
  #     resources :articles, :only => [:index, :show], :format => :json
  #     get 'articles/category/:id' => 'articles#category'
  #   end
  # end
  
  
  authenticated :user do
    root to: 'home#index'
  end
  
  as :user do
    root to: 'devise/sessions#new'
  end
  
  resources :categories
  resources :device_infos, only: [:index, :destroy]
  resources :notifications, only: [:index, :new, :create]
  resources :articles do
    member do
      put :open
      put :close
    end
  end
  
  mount LiveBaike::API => '/'
  
end
