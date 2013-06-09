module LiveBaike
  module APIEntities
    class Category < Grape::Entity
      expose :id, :name, :color, :articles_count, :created_at
    end
    
    class Article < Grape::Entity
      expose :id, :title, :created_at
    end
    
    class ArticleDetail < Grape::Entity
      expose :body
    end
  end
end