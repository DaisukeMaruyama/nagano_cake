class ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]


  PER = 8

  def index
    @items = Item.all.page(params[:page]).per(PER).order(created_at: :desc)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new(item_id: @item.id)
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :introduction, :genre_id, :price)
  end

end
