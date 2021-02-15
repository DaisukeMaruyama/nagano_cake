class CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @customer = Customer.find(params[:id])
  end

  def withdraw
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer(@customer.id)
    else
      render :edit
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def unsubscribe
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :postal_code,
      :address,
      :phone_number,
      :email)
  end
  
  
end
