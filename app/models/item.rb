class Item < ApplicationRecord

  validates :image, presence: true
  validates :item_name, length: {minimum: 1, maximum:15}, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :price, numericality: true, presence: true
  #validates :is_active, inclusion: {in: [true, false]}後で修正

  belongs_to :genre
  has_many :cart_items, dependent: :destroy

  enum is_active:{販売中:true, 販売停止中:false}

  attachment :image

  # TAX
  def price_with_tax
    (price*1.1).round
  end

end
