class Order < ApplicationRecord

  enum payment_method: [:クレジットカード, :銀行振込]
  enum address_type: [ご自身の住所:0, 登録済住所から選択:1, 新しいお届け先:2]
  enum making_status: [ :入金待ち, :入金確認, :製作中, :発送準備中, :発送済み ]

  belongs_to :customer
  has_many :order_details, dependent: :destroy


end
