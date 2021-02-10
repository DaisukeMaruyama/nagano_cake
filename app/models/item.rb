class Item < ApplicationRecord

    has_many :order_items,dependent: :destroy
    has_many :cart_items,dependent: :destroy
    belongs_to :genre
    enum is_active: { 販売中: 0, 販売停止中: 1 }
    attachment :image
    validates :name, presence: true
    validates :price, presence: true

end
