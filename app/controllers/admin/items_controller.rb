class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
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
