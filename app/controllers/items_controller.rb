class ItemsController < ApplicationController
  def index
  end

  def create
    Item.create(tweet_params)
    redirect_to '/'
  end

  def new
    @item = Item.new
  end

  private
  
  def item_params
    params.require(:item).permit(:item_name, :price, :item_explain, :category_id, :item_condition_id, :delivery_charge_id, :prefecture_id, :until_sendday_id).merge(user_id: current_user.id)
  end
end
