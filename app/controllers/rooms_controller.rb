class RoomsController < ApplicationController
  def index
    @user = current_user
    @rooms = Room.all
  end

  def new
    @user = current_user
    @room = Room.new
  end

  def create
    @user = current_user
    @room = Room.new(params.require(:room).permit(:name,:introducution,:total,:address,:picture,:id))
    
    if @room.save
      flash[:notice] = "ルーム情報を新規登録しました"
      redirect_to room_path(room)
    else
      flash[:alert] = "登録できませんでした"
      render "new"
    end

  end

  def show
    @user = current_user
    @room = Room.find(params[:id])
    
  end


end
