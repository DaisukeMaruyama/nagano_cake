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
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
        flash[:notice] = "配送先を編集しました"
      redirect_to deliveries_path
    else
      render :index
    end
  end

  def destroy
    @delivery = Delivery.find_by(params[:id])
    @delivery.destroy
    flash[:notice] = "配送先を削除しました。"
    redirect_to deliveries_path
  end

  private

  def delivery_params
    params.require(:delivery).permit(:postal_code, :address, :name)
  end

end
