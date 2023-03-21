class OrderDetail < ApplicationRecord
  
  belongs_to :order
  belongs_to :item
  
  enum making_status: { preparation: 0, shipping: 1, transit: 2, arrived: 3 }
  
end
