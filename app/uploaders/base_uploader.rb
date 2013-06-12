# coding: utf-8
require 'carrierwave/processing/mini_magick'
class BaseUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  # 重写上传文件存放的目录
  def store_dir
    "#{model.class.to_s.underscore}"
  end
  
  # 调整临时文件的存放路径， 默认是在 public 下面
  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end
  
  # 如果没有图片上传那么提供一个默认的图片地址
  def default_url
    "photo/#{version_name}.jpg"
  end
  
  # 支持的文件上传格式
  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
end