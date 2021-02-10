class SearchController < ApplicationController
  def search
    @value = params["search"]["value"]         #データを代入
    @how = params["search"]["how"]             #データを代入
    @datas = search_for(@how, @value)          #def search_forを実行(引数に検索ワードと検索方法)
  end

  private

  def match(value)
    
    Item.where(item_name: value).or(Item.where(genre_id: value))
  end
  
  def forward(value)                              
    Item.where("item_name LIKE ?", "#{value}%")        
  end

  def backward(value)
    Item.where("item_name LIKE ?", "%#{value}")
  end

  def partical(value)
    Item.where("item_name LIKE ?", "%#{value}%")
  end


  def search_for(how, value)
    case how                    
    when 'match'                 
      match(value)
    when 'forward'
      forward(value)
    when 'backward'
      backward(value)
    when 'partical'
      partical(value)
    end
  end

  
end
