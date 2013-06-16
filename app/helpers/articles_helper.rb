# coding: utf-8
module ArticlesHelper
  def render_article_status(article)
    if article.status.to_i == 0
      content_tag :span, '不可见', class: 'label label-info'
    else
      content_tag :span, "可见", class: 'label label-success'
    end
  end
  
  def render_article_open_btn(article)
    
    if article.status.to_i == 0
      label = 'Open'
      path = open_article_path(article)
      flag = false
    else
      label = 'Close'
      path = close_article_path(article)
      flag = true
    end
    
    if flag
      link_to label, path, :method => :put, :confirm => '此操作会影响客户端数据的使用，请慎用！！！', class: 'btn btn-mini', :remote => true
    else
      link_to label, path, :method => :put, :confirm => '你确定要将此数据放开给用户吗？', class: 'btn btn-mini', :remote => true
    end
    
  end
end
