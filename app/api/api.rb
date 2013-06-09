# coding: utf-8
module LiveBaike
  class API < Grape::API
    format :json
    prefix 'api'
    
    resources :categories do
      get do
        @categories = Category.all
      end
    end
  end
end