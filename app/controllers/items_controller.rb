class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_item, except: [:index, :new, :create]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
    if @item.user_id != current_user.id || @item.order.present?
      redirect_to root_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
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
    params.require(:item).permit(:name, :text, :image, :price, :user_id, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id,
                                 :scheduled_delivery_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find_by(id: params[:id])
    return unless @item.nil?

    flash[:alert] = 'Item not found'
    redirect_to root_path and return
  end

  def contributor_confirmation
    redirect_to root_path unless current_user.id == @item.user_id
  end
end
