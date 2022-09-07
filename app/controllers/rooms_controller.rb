class RoomsController < ApplicationController

  #before_action :set_q,only: [:home, :search]

  def index
    @user = current_user
    @rooms = Room.all
  end

  def home
    @user = current_user
    @rooms = Room.all

  # @result = @q.result
   # @rooms = Room.search(params[:address])
 end
 
 def address
   redirect_to search_rooms_path
 end

  def search
   @user = current_user
   @rooms = Room.where('rooms.address LIKE(?)',"%#{params[:address]}%")
   if params[:keyword].present?
     @rooms = Room.where([ 'rooms.address LIKE ? OR rooms.introducution LIKE ? OR rooms.room_name LIKE ? ', "%#{params[:keyword]}%","%#{params[:keyword]}%","%#{params[:keyword]}%" ])
    end

  end

  def new
    @user = current_user
    @room = Room.new
  end

  def create
    @user = current_user
    @room = Room.new(params.require(:room).permit(:room_name,:introducution,:total,:address,:picture,:user_id))
    if @room.save
      redirect_to :rooms ,notice: "ルーム情報を新規登録しました"
    else
      render "new" 
    end
  end
  
  def show
    @rooms = Room.find(params[:id])
    @reservations = Reservation.new
  end

# def search
#   @rooms = Room.all
#   @user = current_user
#   @rooms = Room.where('rooms.address LIKE(?)',"%#{params[:search]}%")
#   @search_result = "#{params[:search]}"
#@result = @q.result

end
