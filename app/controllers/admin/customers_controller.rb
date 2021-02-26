class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(admin_customer_params)
      flash[:notice] = "会員の編集を保存しました。"
      redirect_to admin_customers_path
    else
      render :edit
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  

  private

  def admin_customer_params
    params.require(:customer).permit(
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :phone_number,
      :postal_code,
      :address,
      :email,
      :is_deleted
      )
  end



end
