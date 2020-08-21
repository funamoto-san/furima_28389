class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :destroy]

  def index
    @items = Item.all.order("created_at ASC")
  end

  def new
    @item = Item.new
  end


  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :state_id, :delivery_charge_id, :shipping_region_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
