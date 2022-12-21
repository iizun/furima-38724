class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @item = Item.find(params[:item_id])
    @order = @item.order
    return redirect_to root_path if @item.user_id == current_user.id || @order != nil
    @order_ship = OrderShip.new
  end

  def create
    @order_ship = OrderShip.new(order_ship_params)
    if @order_ship.valid?
      @order_ship.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_ship_params
    params.require(:order_ship).permit(:post_code, :prefecture_id, :city, :house_number, :building_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
