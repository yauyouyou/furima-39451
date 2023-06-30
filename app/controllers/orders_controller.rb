class OrdersController < ApplicationController

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.save
      # 保存成功時の処理
      redirect_to root_path
    else
      # 保存失敗時の処理
      render :index
    end
  end


  private

  def order_address_params
    params.require(:order_address).permit(:user, :item, :post_code, :prefecture_id, :municipality, :address, :telephone_number, :building_name)
  end
end
