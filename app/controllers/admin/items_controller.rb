class Admin::ItemsController < ApplicationController

  PER = 10

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all.page(params[:page]).per(PER)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "編集を保存しました。"
      redirect_to admin_items_path
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to items_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :introduction, :genre_id, :price)
  end

end
