class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :cart_items  
  
   # カートアイテム合計
  def cart_item_sum
    total = 0
    cart_items.each do |cart_item|
      total += cart_item.subtotal_price
    end
    total
  end
  
  # カートアイテム個数合計
  def cart_total_count
    count = 0
    cart_items.each do |cart_item|
      count += cart_item.count
    end
    count
  end
  
end
