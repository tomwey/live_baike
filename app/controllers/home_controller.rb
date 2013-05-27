class HomeController < ApplicationController
  def index
    @categories = Category.all
    @artices = Article.all
  end
end
