class Admin::SearchController < ApplicationController

  def search
    
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @how = params["search"]["how"]
    @datas = search_for(@how, @model, @content).page(params[:page]).per(10)
  end

  private
  def match(model, content)
    if model == 'item'
      Item.where(item_name: content)
    elsif model == 'customer'
      Customer.where("last_name LIKE ? AND first_name LIKE?", "%#{content}%", "%#{content}%")
    end
  end

  def forward(model, content)
    if model == 'item'
      Item.where("item_name LIKE ?", "#{content}%")
    elsif model == 'customer'
      Customer.where("last_name LIKE ?", "#{content}%")
    end
  end

  def backward(model, content)
    if model == 'item'
      Item.where("item_name LIKE ?", "%#{content}")
    elsif model == 'customer'
      Customer.where("first_name LIKE ?", "%#{content}")
    end
  end

  def partical(model, content)
    if model == 'item'
      Item.where("item_name LIKE ?", "%#{content}%")
    elsif model == 'customer'
      Customer.where("first_name LIKE ? OR last_name LIKE?", "%#{content}%", "%#{content}%")
    end
  end

  def search_for(how, model, content)
    case how
    when 'match'
      match(model, content)
    when 'forward'
      forward(model, content)
    when 'backward'
      backward(model, content)
    when 'partical'
      partical(model, content)
    end
  end
end

