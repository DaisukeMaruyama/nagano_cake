class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @shipping_cost = 800
     # 商品合計(送料なし)
    @payment_without_shipping = @order.total_payment -= @shipping_cost
    # 商品合計(送料あり)
    @payment_with_shipping = @order.total_payment += @shipping_cost
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(admin_order_params)
      flash[:notice] = "編集を保存しました。"
      redirect_to admin_orders_path
    else
      render :show
    end
  end
  
  
  private
  
  def admin_order_params
    params.require(:order).permit(:order_status)
  end
  
end
