class Api::ApplicationController < ApplicationController
  respond_to :json
  
  def restrict_access
    api_key = ApiKey.find_by_access_token(params[:access_token])
    head :unauthorized unless api_key
  end
end