class OrderDetail < ApplicationRecord

  belongs_to :item
  belongs_to :order
  
  def subtotal_price
    price * amount
  end

end
