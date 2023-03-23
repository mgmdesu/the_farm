class Admin::OrdersController < ApplicationController
  before_action :authentication_admin!
  
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total = 0
    @order_items.each do |order_item|
      @total += order_item.tax_included_price * order_item.amount
    end 
    @customer = @order.customer
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "payment_confirmation"
      @order.order_details.update(confting_status: "production_pending")
    end 

end
