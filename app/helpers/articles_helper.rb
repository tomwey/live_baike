# coding: utf-8
module ArticlesHelper
  def render_article_status(article)
    status = article.status.to_i
    case status
    when 0
      content_tag :span, '待审核', class: 'label label-info'
    when 1
      content_tag :span, '已发布', class: 'label label-success'
    when 2
      content_tag :span, '已审核', class: 'label label-important'
    when 3
      content_tag :span, '未通过', class: 'label label-warning'
    else
      ""
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
