class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_item, except: [:index, :new]
  before_action :new_item, only: [:new, :create]

  def index
    @items = Item.all
  end

  def show
  end

  def new
  end

  def create
    @list = current_user.list
    if @item.save(item_params)
      ListsItem.create(item_id: @item.id, @list.id)
      redirect_to list_path(@list)
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
end
  private

  def item_params
    params.require(:item).permit(:title, :description, :completed)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
