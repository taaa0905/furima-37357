class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :new]
  def index
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
  end
  def new
    @item = Item.find(params[:item_id])
  end
  def create
  end

  private
  def purchase_params
    params.require(:purchase).merge(user_id: current_user.id, item_id: current_item.id)
  end
end
