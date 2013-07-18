LiveBaike::Application.routes.draw do
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
  
  # match "categories/category:id/articles/published" => "#published", :as => :published_category_articles
  # match "articles/category:id/approved" => "articles#approved", :as => :approved_category_articles
  # match "articles/category:id" => "articles#index", :as => :category_articles
  
  resources :device_infos, only: [:index, :destroy]
  resources :notifications, only: [:index, :new, :create]
  resources :publishes, only: [:index, :new, :create] 
  
  match 'publish/auto_send' => 'publishes#auto_send', via: :get, as: 'auto_send_publish'
  
  resources :articles do
    member do
      put :open
      put :close
    end
    collection do
      get :publish
      get :published
      get :approved
    end
  end
  
  mount LiveBaike::API => '/'
  
end
