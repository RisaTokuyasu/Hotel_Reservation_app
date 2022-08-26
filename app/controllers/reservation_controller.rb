class ReservationController < ApplicationController
  def index

  end

  def new
      @user = current_user
      @room = Room.find(params[:id])
      @reservation = Reservation.new
  end

  def show
      @room = Room.find(params[:id])
      @reservation = Reservation.find(params[:id])
  end 

  def index
      
  end
end
