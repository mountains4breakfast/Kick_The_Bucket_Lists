class ListsController < ApplicationController
before action :find_list, only[:show, :edit, :update]

  def index
    @lists = List.all
  end

  def show
    @items = @list.items
    @user = User.find(@list.user_id)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to list_path
    else
      render :edit
    end
  end

  private

    def list_params
      params.require(:list).permit(:title, :description, :user_id)
    end

    def find_list
      @list = List.find(params[:id])
    end
end
