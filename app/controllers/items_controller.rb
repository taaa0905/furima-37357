class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :detail, only: [:update, :show]
  before_action :sold_out, only: [:edit]
  def index
    @items = Item.order('created_at DESC')
    @purchase = Purchase.all
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
    @user = @item.user
    @purchase = Purchase.all
  end

  def edit
    @purchase = Purchase.all
    if current_user.id == detail.user_id
      detail
    else
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      redirect_to action: :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :explanation, :category_id, :condition_id, :shipping_charge_id, :prefecture_id,
                                 :packaging_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def detail
    @item = Item.find(params[:id])
  end

  def sold_out
    @purchase = Purchase.all
    if @purchase.where(item_id: @item.id).exists?
      redirect_to root_path
    end
  end
end