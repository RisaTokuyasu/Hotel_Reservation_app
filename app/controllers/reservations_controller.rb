class ReservationsController < ApplicationController
  def index
    @user = current_user
    @reservations = Reservation.all
  end

  def new
    @user = current_user
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def confirm
    @user = current_user
    @reservation = Reservation.new(reservation_params)

    if @reservation.invalid?
      render "new"
    else
     @room = @reservation.room
     @reservation.total_day = (@reservation.end_date - @reservation.start_date).to_i
     @reservation.total_price = (@room.total * @reservation.total_day * @reservation.people).to_i
     end
    
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:room_id,:user_id,:start_date,:end_date,:price,:total_price,:people,:total_day))
    if params[:back] || !@reservation.save
      render "index"
    else
      redirect_to  reservation_path(@reservation), notice: "予約が完了しました"
    end
  end

  def show
    @user = current_user
    @reservation = Reservation.find(params[:id])
    #@rooms = @reservation.room_id

  end 

  private

  def reservation_params
    params.require(:reservation).permit(:room_id,:user_id,:start_date,:end_date,:people)
  end
end
