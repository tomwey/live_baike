class NotificationsController < ApplicationController
  def index
    @notifications = Notification.includes(:device_infos).paginate :page => params[:page], :per_page => 30
  end
  
  def new
    @notification = Notification.new
  end
  
  def create
    @notification = Notification.new(params[:notification])
    if @notification.save
      redirect_to notifications_url, notice: 'Notificaiton was successfully created.'
    else
      render 'new'
    end
  end
  
end
