class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @items = Item.all
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :item_explain, :category_id, :item_condition_id, :delivery_charge_id,
                                 :prefecture_id, :until_sendday_id, :image).merge(user_id: current_user.id)
  end
end
