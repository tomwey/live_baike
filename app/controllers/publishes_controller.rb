class PublishesController < ApplicationController
  def index
    @publishes = Publish.order('id DESC').paginate :page => params[:page], :per_page => 15
  end

  def new
    @publish = Publish.new
  end

  def create
    @publish = Publish.new(params[:publish])
    
    if @publish.save
      redirect_to publishes_url, notice: "Publish was successfully created."
    else
      render :new
    end
  end
  
  def auto_send
    
  end
end
