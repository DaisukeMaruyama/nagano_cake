class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  
  enum is_active:{販売中:true, 販売停止中:false}

  attachment :image
  
  # TAX
  def price_with_tax
    (price*1.1).round
  end
	
end
