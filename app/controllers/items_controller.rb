class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order("created_at ASC")
  end

  def new
    @item = Item.new
    @item.save
  end

  def create
  end

  def edit
  end

  def show
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
