class Order < ApplicationRecord

  enum payment_method: [:クレジットカード, :銀行振込]
  enum address_type: [ご自身の住所:0, 登録済住所から選択:1, 新しいお届け先:2]
  enum making_status: [入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4]

  belongs_to :customer
  has_many :order_details, dependent: :destroy


end
