class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root, only: [:index, :create]

  def index
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new
  end

  def create
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new(purchase_record_params)
    if @purchase_record_shipping_address.valid?
      pay_item
      @purchase_record_shipping_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_record_shipping_address).permit(:postal_code, :prefecture_id, :city, :house_number, :phone_number, :building_name, :purchase_record_id).merge(
      user_id: current_user.id, item_id: params[:id], token: params[:token]
    )
  end

  def move_to_root
    if current_user.id == Item.find(params[:id]).user_id || PurchaseRecord.find_by(item_id: params[:id]).present?
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY_FURIMA']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end
end
