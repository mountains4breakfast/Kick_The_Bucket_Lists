class ListsItemsController < ApplicationController
  def show
    @list = List.find(params[:list_id])
    @item = Item.find(params[:item_id])
  end

end
