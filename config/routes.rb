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
  resources :articles do
    member do
      put :open
      put :close
    end
  end
  
  mount LiveBaike::API => '/'
  
end
