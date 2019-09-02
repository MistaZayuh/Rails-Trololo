class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  def show
  end

  def new
    @list = @board.lists.new
  end

  def create
    List.create_list(list_params, @board.id)
    redirect_to customers_path
  end

  def edit
  end

  def update
    List.update_list(@list.id, list_params)
    redirect_to board_list_path(@board, @list)
  end

  def destroy
    List.delete_list(@list.id)
    redirect_to board_path(@board)
  end

  private
  def set_board
    @board = Board.find(params[:id])
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :priority)
  end
end
