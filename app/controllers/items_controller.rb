class ItemsController < ApplicationController
 before_action :authenticate_user!, only: [:new]

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
  @item = Item.find_by(id: params[:id])
end

 private

  def item_params
    params.require(:item).permit(:image,:name,:explanat,:price,:category_id,:status_id,:derivery_charge_id,:sender_area_id,:daystosend_id).merge(user_id:current_user.id)
  end

end