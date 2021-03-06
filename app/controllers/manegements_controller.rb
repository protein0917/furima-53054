class ManegementsController < ApplicationController
  before_action :authenticate_user!
  before_action :definition_item, only: [:index, :create]

  def index
    @manegement_address = ManegementAddress.new
    if current_user == @item.user || @item.manegement.present?
       redirect_to root_path
    end
  end

  def create
    @manegement_address = ManegementAddress.new(manegement_address_params)
    if@manegement_address.valid?
      pay_item
      @manegement_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def definition_item
    @item = Item.find(params[:item_id])
  end

  def manegement_address_params
    params.require(:manegement_address).permit(:post_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number, :manegement_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: manegement_address_params[:token],
      currency: 'jpy'
    )
  end



end
