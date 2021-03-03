class CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:update, :edit]

  def show
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "登録情報を編集しました。"
      redirect_to customer_path(current_customer)
    else
      render :edit
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: "Deleted")
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end
  
  def ensure_correct_customer
    if params[:id].to_i != current_customer.id
      flash[:alert] = "権限がありません。"
      redirect_to customer_path(current_customer)
    end  
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
