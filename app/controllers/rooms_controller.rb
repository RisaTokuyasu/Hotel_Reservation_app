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
   @search_result = "#{params[:address]}"
    # @result = @q.result

  end

  def new
    @user = current_user
    @room = Room.new
  end

  def create
    @user = current_user
    @room.user_id = current_user.id
    @room = Room.new(params.require(:room).permit(:name,:introducution,:total,:address,:picture,:id))
    if @room.save
      redirect_to new_reservation_path(id: @room.id) ,notice: "ルーム情報を新規登録しました"
    else
      render "new"
    end

  end
  
  def show
    @rooms = current_user.rooms
  end

# def search
#   @rooms = Room.all
#   @user = current_user
#   @rooms = Room.where('rooms.address LIKE(?)',"%#{params[:search]}%")
#   @search_result = "#{params[:search]}"
#@result = @q.result

# end

  #private

 # def set_q
  #  @q = Room.ransack(params[:q])
  #end

end
