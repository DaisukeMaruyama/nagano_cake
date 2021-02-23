class Delivery < ApplicationRecord

  validates :postal_code, presence: true
	validates :address, presence: true
	validates :name, presence: true

  belongs_to :customer

  def full_shipping_address
    "〒"+self.postal_code + "　" + self.address + "　" + self.name
  end

end
