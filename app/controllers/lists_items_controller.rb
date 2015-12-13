class ListsItemsController < ApplicationController
  def show
    @list = List.find(params[:list_id])
    @item = Item.find(params[:item_id])
    @lists_item = ListsItem.where({list_id: @list.id, item_id: @item.id}).first
  end

  def copy
    @list = current_user.lists.first
    @item = Item.find(params[:item_id])
    if ListsItem.create(item_id: @item.id, list_id: @list.id)
      redirect_to list_path(@list)
    else
      redirect_to item_path(@item)
    end
  end

  def update
    @lists_item = ListsItem.find(params[:id])
    @list = List.find(@lists_item.list_id)
    @item = Item.find(@lists_item.item_id)
    if @lists_item.update({completed: !@lists_item.completed})
      redirect_to join_path(@list, @item)
    else
      render :new
    end
  end

  private

  def lists_item_params
    params.require(:lists_item).permit(:completed)
  end
end
