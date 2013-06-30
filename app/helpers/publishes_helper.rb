# coding: utf-8
module PublishesHelper
  
  def render_publish_category(publish)
    category_id = publish.category_id.to_i
    category = Category.find_by_id(category_id)
    category.blank? ? "" : category.name
  end
  
  def render_publish_type(publish)
    type = publish.publish_type.to_i
    case type
    when 0 
      "手动发布"
    when 1 
      "自动发布"
    else ""
    end
  end
  
  def render_publish_time(publish)
    type = publish.publish_type.to_i
    if type == 0
      publish.created_at
    else
      (publish.created_at.to_date + 1).to_s + " 04:00:00 +0800"
    end
  end
end
