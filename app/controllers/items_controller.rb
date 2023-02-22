class ItemsController < ApplicationController
 before_action :authenticate_user!, only: [:new, :edit]

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
  @item = Item.find(params[:id])
end

def edit
  @item = Item.find(params[:id])
  unless current_user.id == @item.user_id
    redirect_to root_path
  end
end

def update
  @item = Item.find(params[:id])
  if @item.update(item_params)
    redirect_to item_path(params[:id])
  else
    render :edit
  end
end


 private

  def item_params
    params.require(:item).permit(:image,:name,:explanat,:price,:category_id,:status_id,:derivery_charge_id,:sender_area_id,:daystosend_id).merge(user_id:current_user.id)
  end

end