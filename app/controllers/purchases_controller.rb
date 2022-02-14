class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :new]
  def index
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def new
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    # @purchase = Purchase.new
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      # Address.create#(purchase_params)
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    # @purchase = Purchase.new
    # @item = Item.find(params[:item_id])
    # @purchase_address = PurchaseAddress.new
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
 
end
