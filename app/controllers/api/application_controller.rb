# coding: utf-8
class Api::ApplicationController < ApplicationController
  respond_to :json
  
  skip_before_filter :authenticate_user!
  
  def restrict_access
    api_key = ApiKey.find_by_access_token(params[:access_token])
    unless api_key
      render json: { :code => 401,:message => 'Token不正确', :data => [] }
      return false
    end
    # head :unauthorized unless api_key
  end
end