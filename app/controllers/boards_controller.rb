class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  def index
    @boards = Board.all_boards
  end

  def show
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.create_board(board_params)
    redirect_to @board
  end

  def edit
  end

  def update
    @board = Board.update_board(board_params)
    redirect_to @board
  end

  def destroy 
    @board.destroy
    redirect_to root_path
  end

  private
    def set_board
      @board = Board.find(params[:id])
    end

    def board_params
      params.require(:board).permit(:name)
    end

end
