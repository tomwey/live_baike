# coding: utf-8
module Api
  module V1
    class ArticlesController < Api::ApplicationController
      
      before_filter :restrict_access
      # e86515d5bf9fbc3202e24f5fb3571c7d
      
      def index
        # @categories = Category.where('articles_count > 0')
        # if @categories.any?
        #   render json: { code: 200, message: 'ok', data:@categories.as_json(only: [:id, :name, :color, :articles_count]) }
        # else
        #   render json: { code: 404, message: '没有数据!', data:[] }
        # end
        @articles = Article.select('id, title, created_at').order('created_at DESC').paginate :page => params[:page], :per_page => params[:per_page] || 30
        if @articles.any?
          render json: { code: 200, message: 'ok', data:@articles.as_json(only: [:id, :title, :created_at]) }
        else
          render json: { code: 404, message: "没有数据!", data: [] }
        end
      end
      
      def show
        @article = Article.select('body').where(:id => params[:id])
        if @article
          render json: { code: 200, message: "ok", data: @article.as_json(only: :body) }
        else
          render json: { code: 404, message: "没有数据!", data:[] }
        end
      end
      
      def create
        Article.create!(title:params[:title], body:params[:body], category_id:params[:category_id])
      end
      
      def category
        @category = Category.find(params[:id])
        if @category
          @articles = @category.articles.select('id, title, created_at').order('created_at DESC').paginate :page => params[:page], :per_page => params[:per_page] || 30
          if @articles.any?
            render json: { code: 200, message: 'ok', data:@articles.as_json(only: [:id, :title, :created_at]) }
          else
            render json: { code: 404, message: "没有数据!", data:[] }
          end
        else
          render json: { code: 404, message: "没有此类别!", data:[] }
        end
        
      end
    end
  end
end