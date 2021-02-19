class Order < ApplicationRecord

  enum payment_method: {クレジットカード:0, 銀行振込:1}
  enum address_type: {ご自身の住所:0, 登録済住所から選択:1, 新しいお届け先:2}
  enum order_status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4}


  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  # 小計計記載（個々の製品）
  def total_price
    total = 0
    order_details.each do |order_detail|
    	total += order_detail.price
    end
    total
  end

	# 個数小計
	def total_count
		total = 0
		order_details.each do |order_detail|
			total += order_detail.amount
		end
		total
	end

end
