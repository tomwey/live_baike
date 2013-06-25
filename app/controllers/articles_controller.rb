# coding: utf-8
class ArticlesController < ApplicationController
  def index
    @articles = Article.order('updated_at DESC').includes(:category).paginate :page => params[:page], :per_page => 20
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
