class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @user = current_user
  end

  def new
    @user = current_user
    @room = Room.new
  end

  def create
    @user = current_user
    @room = Room.new(params.require(:room).permit(:name,:total,:address,:introducution,:picture))
    if @room.save
      flash[:notice] = "ルーム情報を新規登録しました"
      redirect_to :rooms
    else
      flash[:notice] = "登録できませんでした。もう一度入力してください"
      render "new"
    end

  end

  def show
    @user = current_user
    @room = Room.find(params[:id])
  end

end
