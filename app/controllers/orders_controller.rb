class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :item_find, only: [:index, :create]

  def index
    @order = @item.order
    return redirect_to root_path if @item.user_id == current_user.id || !@order.nil?

    @order_ship = OrderShip.new
  end

  def create
    @order_ship = OrderShip.new(order_ship_params)
    if @order_ship.valid?
      pay_item
      @order_ship.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_find
    @item = Item.find(params[:item_id])
  end

  def order_ship_params
    params.require(:order_ship).permit(:post_code, :prefecture_id, :city, :house_number, :building_number, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_ship_params[:token],
      currency: 'jpy'
    )
  end
end
