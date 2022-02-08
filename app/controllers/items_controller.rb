class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  def index
    @items = Item.order("created_at DESC")
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end
  def edit
    if user_signed_in? && current_user.id == Item.find(params[:id]).user_id
      @item = Item.find(params[:id])
    else
      redirect_to action: :index
    end
  end
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :explanation, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :packaging_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
