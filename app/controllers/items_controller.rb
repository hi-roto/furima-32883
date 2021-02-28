class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :move_to_root, only: [:edit, :update]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :edit
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :category_id, :item_status_id, :postage_payer_id, :prefecture_id,
                                 :preparation_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_root
    redirect_to root_path unless current_user.id == Item.find(params[:id]).user.id
  end
  
  def set_item
    @item = Item.find(params[:id])
  end
end
