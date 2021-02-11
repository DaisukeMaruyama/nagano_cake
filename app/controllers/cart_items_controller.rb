class CartItemsController < ApplicationController

  def index
    @customer = Customer.find(current_customer.id)
  end

  def create
  end

  def destroy
  end

  def destroy_all
  end

  def update
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:amount,:item_id)
  end
end
