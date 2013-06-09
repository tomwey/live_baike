LiveBaike::Application.routes.draw do
  
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :categories, :only => [:index, :create], :format => :json
      resources :articles, :format => :json
    end
  end
  
  
  authenticated :user do
    root to: 'home#index'
  end
  
  as :user do
    root to: 'devise/sessions#new'
  end
  
  resources :categories
  resources :articles
  
  
end
