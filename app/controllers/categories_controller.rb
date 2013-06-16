# coding: utf-8
class CategoriesController < ApplicationController
  def index
    @categories = Category.order('articles_count DESC').paginate :page => params[:page], :per_page => 30
  end
  
  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.paginate :page => params[:page], :per_page => 30
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    
    if @category.save
      redirect_to categories_path, notice: "Category was created."
    else
      render :new
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    
    if @category.update_attributes(params[:category])
      redirect_to categories_path, notice: "Category was updated."
    else
      render :edit
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_url
  end
end
