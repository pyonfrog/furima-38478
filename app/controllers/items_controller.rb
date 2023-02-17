class ItemsController < ApplicationController
 before_action :authenticate_user!, only: [:new]

 def index
   @item = Item.order("created_at DESC")
 end

 def item_params
   params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
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

 private

  def item_params
    params.require(:item).permit(:image,:name,:explanat,:price,:category_id,:status_id,:derivery_charge_id,:sender_area_id,:daystosend_id).merge(user_id:current_user.id)
  end

end