class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :detail, only: [:index,:create]
  before_action :check, :buy_item, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def detail
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :block, :building, :tel_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end
  def check
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
  def buy_item
    if Purchase.where(item_id: @item.id).exists?
      redirect_to root_path
    end
  end
  
end
