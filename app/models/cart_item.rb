class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer

	# TAX
	def subtotal_price
	    (amount * item.price * 1.1).round
	end


end
