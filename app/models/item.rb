class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy

  attachment :image
  
  # TAX
  def price_with_tax
    (price*1.1).round
  end
	
end
