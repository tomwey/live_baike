# coding: utf-8
require "entities"
require "helpers"
module LiveBaike
  class API < Grape::API
    format :json
    prefix 'api'
    
    helpers APIHelpers
    
    # 获取所有的类别
    # /api/categories
    resource :categories do
      get do
        authenticate!
        @categories = Category.all
        
        if @categories.empty?
          render_404_json
        else
          present @categories, :with => APIEntities::Category
          render_json(body())
        end
      end
    end
    
    # 分页获取某类别下面的标题
    # /api/articles/title_list
    resource :articles do
      get '/title_list' do
        authenticate!
        
        # mode 0:表示加载更多;1:表示获取最新的数据
        mode = params[:mode].to_i
        
        # mode只能是0，1
        if  not (mode == 0 or mode == 1)
          return render_error_json(404, '数据为空')
        end
        
        time = params[:time].to_i
        
        if params[:cid]
          @category = Category.find_by_id(params[:cid])
          # 某个类别下面的查询
          return render_error_json(404, '数据为空') if @category.blank?
          @articles = @category.articles.latest_title_list(time, mode).includes(:category).limit(page_size)
        else
          # 首页查询
          @articles = Article.latest_title_list(time, mode).includes(:category).limit(page_size)
        end
        
        # @category = Category.find_by_id(params[:cid])
        # return render_error_json(404, '数据为空') if @category.blank?
        #       
        # @articles = @category.articles.select('id, title, created_at').order('created_at DESC').paginate :page => current_page, :per_page => page_size
        
        if @articles.empty?
          render_404_json
        else
          present @articles, :with => APIEntities::Article
          render_json(body())
        end
      end
    end
    # resource :category do
      # get '/article_titles' do
      #   authenticate!
      #   @category = Category.find_by_id(params[:cid])
      #   return render_error_json(404, '数据为空') if @category.blank?
      # 
      #   @articles = @category.articles.select('id, title, created_at').order('created_at DESC').paginate :page => current_page, :per_page => page_size
      #   
      #   if @articles.empty?
      #     render_404_json
      #   else
      #     present @articles, :with => APIEntities::Article
      #     render_json(body())
      #   end
      # end
    # end
    
    # 获取某篇文章的详细内容
    # api/article/body
    resource :article do
      get '/body' do
        authenticate!
        aid = params[:aid].to_i
        @article = Article.select('body, image').where(:id => aid)
        if @article.present?
          present @article, :with => APIEntities::ArticleDetail
          render_json(body())
        else
          render_404_json
        end
      end
    end
    
    resource :device_infos do
      params do
        requires :device_token, type: String, desc: "Your device token"
      end
      post do
        @device_info = DeviceInfo.where(:device_token => params[:device_token]).first_or_create
        if @device_info
          body({ code: 201 })
        else
          body({ code: 400 })
        end
      end
    end
    
    # get '/article_body' do
    #   authenticate!
    #   aid = params[:aid].to_i
    #   @article = Article.select('body').where(:id => aid)
    #   if @article.present?
    #     present @article, :with => APIEntities::ArticleDetail
    #     render_json(body())
    #   else
    #     render_404_json
    #   end
    # end
    
  end
end