# coding: utf-8
class ArticlesController < ApplicationController
  def index
    @articles = Article.approving.without_body.order('id DESC').includes(:category).paginate :page => params[:page], :per_page => 20
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params[:article])
    
    if @article.save
      redirect_to articles_path, notice: "Article was created."
    else
      render :new
    end
  end
  
  def published
    @articles = Article.published.without_body.order('updated_at DESC').includes(:category).paginate :page => params[:page], :per_page => 20
    render :index
  end
  
  def approved
    @articles = Article.approved.without_body.order('updated_at DESC').includes(:category).paginate :page => params[:page], :per_page => 20
    render :index
  end
  
  def publish
    category_id = params[:category_id].to_i
    PublishArticles.random_publish(category_id, 5)
    if category_id.zero?
      redirect_to articles_url
    else
      @category = Category.find(category_id)
      redirect_to @category
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    
    if @article.update_attributes(params[:article])
      redirect_to @article, notice: "Article was updated."
    else
      render :edit
    end
  end
  
  def open
    @article = Article.find(params[:id])
    @article.status = 1
    @article.access_time = Time.now.to_i
    @article.save!
    # render :text => 1
  end
  
  def close
    @article = Article.find(params[:id])
    @article.status = 0
    @article.save!
    # render :text => 0
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_url
  end
  
  
  
end
