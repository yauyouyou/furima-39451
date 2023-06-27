class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]


  def index
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :item_explain, :category_id, :item_condition_id, :delivery_charge_id, :prefecture_id, :until_sendday_id, :image).merge(user_id: current_user.id)
  end
end
