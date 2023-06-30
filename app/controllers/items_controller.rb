class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
    return unless current_user.id != @item.user_id

    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
    return unless current_user != @item.user
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :item_explain, :category_id, :item_condition_id, :delivery_charge_id,
                                 :prefecture_id, :until_sendday_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end