# coding: utf-8
module Api
  module V1
    class CategoriesController < Api::ApplicationController
      
      before_filter :restrict_access
      # e86515d5bf9fbc3202e24f5fb3571c7d
      
      def index
        @categories = Category.where('articles_count > 0')
        if @categories.any?
          render json: { code: 200, message: 'ok', data:@categories.as_json(only: [:id, :name, :color, :articles_count]) }
        else
          render json: { code: 404, message: '没有数据!', data:[] }
        end
      end
      
      def create
        Category.create!(name:params[:name], color:params[:color])
      end
    end
  end
end