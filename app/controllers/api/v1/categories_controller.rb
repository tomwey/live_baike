module Api
  module V1
    class CategoriesController < Api::ApplicationController
      
      before_filter :restrict_access
      # e86515d5bf9fbc3202e24f5fb3571c7d
      
      def index
        @categories = Category.limit(20)
        respond_with(@categories)
      end
      
      def create
        Category.create!(name:params[:name], color:params[:color])
      end
    end
  end
end