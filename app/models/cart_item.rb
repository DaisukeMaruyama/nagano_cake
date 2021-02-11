class CartItem < ApplicationRecord
  
  belongs_to :item
  belongs_to :cutomer
	
	def subtotal_price
	    (count*item.price*Constants::TAX).round
	end
	
	def price_with_tax
	  item.price * 10.0
	end
	
end
