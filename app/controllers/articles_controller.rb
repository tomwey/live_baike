class ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:category).paginate :page => params[:page], :per_page => 20
  end
end
