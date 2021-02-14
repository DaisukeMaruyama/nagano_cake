class OrdersController < ApplicationController

  def new
    @order = Order.new
    @address = Address.new
    @customer = Customer.find(current_customer.id)
    @registered_addresses = Address.where(customer_id: current_customer.id)
  end

  def show
  end

  def index
  end

  def confirm
    @shipping_cost = 800 #後で管理画面設定。とりあえずはここに８００を記載
    @order = current_customer.orders.build(set_order)
    
    #合計金額
    @order.total_payment = current_customer.cart_items.inject(0){|sum, cart_item| cart_item.subtotal_price + sum} + @shipping_cost
    
    
    # 郵便番号をハイフンありのフォーマットに変更
    @order.postal_code.insert(3, "-") if @order.postal_code.present? 
    case params[:address_type]
    when "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    when "1"
      @order.postal_code = Address.find(set_Address[:id]).postal_code
      @order.address = Address.find(set_Address[:id]).address
      @order.name = Address.find(set_Address[:id]).name
    when "2"
    end
  end
  
  def create
    
  end

  def thanks
  end
  
  def set_order
    params.require(:order).permit(:total_payment, :payment_method, :address, :postal_code, :name)
  end
  
end
