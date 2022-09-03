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
        render :new
     end
    @reservation.total_day = (@reservation.end_date - @reservation.start_date).to_i
    @reservation.total_price = (@reservation.price * @reservation.total_day * @reservation.people).to_i

  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:room_id,:name,:introducution,:picture,:start_date,:end_date,:price,:total_price,:people,:total_day))
    if params[:back] || !@reservation.save
      redirect_to root_path
    else
      redirect_to  reservation_path(@reservation), notice: "予約が完了しました"
    end
  end

  def show
    @user = current_user
    @reservation = Reservation.find(params[:id])
  end 

  private

  def reservation_params
    params.require(:reservation).permit(:room_id,:name,:introducution,:picture,:start_date,:end_date,:people,:price)
  end
end
