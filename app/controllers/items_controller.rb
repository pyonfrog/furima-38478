class ItemsController < ApplicationController
 before_action :authenticate_user!, only: [:new]

 def index
 end

 def item_params
  params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
 end

 def new
 end

 def create
 end


end