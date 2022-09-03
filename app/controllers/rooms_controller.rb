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
      redirect_to new_reservation_path(id: @room.id) ,notice: "ルーム情報を新規登録しました"
    else
      render "new"
    end

  end

  before_action :set_q,only: [:search]

  def search
    @rooms = Room.all
    @user = current_user
    @results = @q.result
    binding.pry
  end

  private

  def set_q
    @q = Room.ransack(params[:q])
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name,:introducution,:total,:address,:picture,:id)
  end

end
