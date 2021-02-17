class DeliveriesController < ApplicationController
  
  def index
    @delivery = Delivery.new
    @deliveries = Delivery.all
  end
  
  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    if @delivery.save
      flash[:notice] = "配送先を登録しました"
      redirect_to deliveries_path
    else
      render :index
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def delivery_params
    params.require(:delivery).permit(:postal_code, :address, :name)
  end

end
