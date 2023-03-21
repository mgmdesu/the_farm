class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  
  # 小計計算
  def subtotal 
    item.tax_included_price * amount
  end 
  
  # enum定義
  enum payment_method: { credit_card: 0, transfer: 1, cash_on_delivery: 2, paypay: 3 }
  enum status: { payment_waiting: 0, payment_confirmation: 1, in_production: 2, preparing_delivery: 3, delivered:4 }
  
end
