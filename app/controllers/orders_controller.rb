class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @Delivery = Delivery.new
    @customer = Customer.find(current_customer.id)
    @registered_addresses = Delivery.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
    @shipping_cost = 800
    
    # 商品合計(送料なし)
    @payment_without_shipping = @order.total_payment -= 800
    # 商品合計(送料あり)
    @payment_with_shipping = @order.total_payment += 800
  end

  def index
    @orders = Order.all
  end

  def confirm
    @shipping_cost = 800
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
      current_customer.deliveries.each do |delivery|
        @order.postal_code = delivery.postal_code
        @order.address = delivery.address
        @order.name = delivery.name
      end
    when "2"
    end
  end

  def create
    @order = current_customer.orders.build(set_order)
    @shipping_cost = 800
    @order.total_payment = current_customer.cart_items.inject(0){|sum, cart_item| cart_item.subtotal_price + sum} + @shipping_cost
    
    unless @order.valid?
      @delivery = Delivery.new
      render :new
    end

     @order.save
      current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item.id
        @order_detail.price = cart_item.item.price_with_tax
        @order_detail.amount = cart_item.amount
        @order_detail.making_status = 0
        @order_detail.save
      end
      #Addressに登録する処理
    Delivery.create(customer_id: current_customer.id, postal_code: @order.postal_code, address: @order.address, name: @order.name)
    current_customer.cart_items.destroy_all
    redirect_to orders_thanks_path
  end

  def thanks
  end
  

  private

  def set_order
    params.require(:order).permit(:total_payment, :payment_method, :address, :postal_code, :name)
  end

end
