class ItemsController < ApplicationController
 before_action :authenticate_user!, only: [:new, :edit, :destroy]
 before_action :set_item, only: [:show, :edit, :update, :destroy]

 def index
  @items = Item.order(created_at: :desc)
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
  unless current_user.id == @item.user_id
    redirect_to root_path
  end
end

def update
  if @item.update(item_params)
    redirect_to item_path(params[:id])
  else
    render :edit
  end
end

def destroy
  if current_user.id == @item.user_id
    @item.destroy
  end
  redirect_to root_path
end


def set_item
  @item = Item.find(params[:id])
end


 private

  def item_params
    params.require(:item).permit(:image,:name,:explanat,:price,:category_id,:status_id,:derivery_charge_id,:sender_area_id,:daystosend_id).merge(user_id:current_user.id)
  end

end