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
    else
      label = 'Close'
      path = close_article_path(article)
    end
    
    link_to label, path, :method => :put, class: 'btn btn-mini', :remote => true
  end
end
