module LiveBaike
  class API < Grape::API
    # error_format :json
    format :json
    prefix "api"
    version 'v1', using: :path
    
    resource :categories do
      get do
        Category.limit(20)
      end
      post do
        Category.create!(:name => params[:name], :color => params[:color])
      end
    end
  end
end