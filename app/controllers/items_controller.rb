class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_item, except: [:index, :new,:create]

  def index
    if params[:tag]
      @items = Item.tagged_with(params[:tag])
    else
      @items = Item.all
    end
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @list = current_user.lists.first
    @item = Item.new(item_params)
    #TODO Not the best way to do this so fix this when you are smarter.
    if @item.save
      if ListsItem.create(item_id: @item.id, list_id: @list.id, completed: false)
        redirect_to list_path(@list)
      else
        render :new
      end
    else
      render :new
    end
  end



  def edit
  end

def update
  if @item.update(item_params)
    redirect_to item_path(@item.id)
  else
    render :new
  end

  def destroy
    @list = List.find(params[:list_id])
    @item = Item.find(params[:item_id])
    @join = ListsItem.where({list_id: @list.id, item_id: @item.id})
    if @join.destroy
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

end
  private

  def item_params
    params.require(:item).permit(:title, :description, :completed,:tag_list)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
