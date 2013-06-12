module LiveBaike
  module APIEntities
    class Category < Grape::Entity
      expose :id, :name, :color
    end
    
    class CategoryDetail < Grape::Entity
      expose :id, :name, :color, :articles_count, :created_at
    end
    
    class Article < Grape::Entity
      expose :id, :title, :created_at
      expose :category, :using => APIEntities::Category
    end
    
    class ArticleDetail < Grape::Entity
      expose :body
      expose(:image_url) do |model, opts|
        if model.image?
          model.image.url
        else
          ""
        end
      end
    end
    
  end
end