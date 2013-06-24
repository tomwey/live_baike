class DeviceInfosController < ApplicationController
  def index
    @device_infos = DeviceInfo.paginate :page => params[:page], :per_page => 30
  end
  
  def destroy
    @device_info = DeviceInfo.find(params[:id])
    @device_info.destroy
    redirect_to @device_infos_url
  end
end
