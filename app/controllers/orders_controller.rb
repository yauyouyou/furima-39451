class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      @order_address.save
      # 保存成功時の処理
      return redirect_to root_path
    else
      # 保存失敗時の処理
      render :index, status: :unprocessable_entity
    end
  end


  private

  def order_address_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipality, :address, :telephone_number, :building_name).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
