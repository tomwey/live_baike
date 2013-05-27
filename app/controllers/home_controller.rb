# coding: utf-8
require 'nokogiri'
require 'open-uri'
class HomeController < ApplicationController
  def index
    
  end
  
  def crawl
    page = Nokogiri::HTML(open("http://www.baimin.com"))
    page.encoding = "utf-8"
    page.css('.KnowCatalog ul li a').each do |link|
      # Category.create(name:li.css('a').text())
      # link = li.css('a')
      puts link['href']
    end
    redirect_to categories_url
  end
end
