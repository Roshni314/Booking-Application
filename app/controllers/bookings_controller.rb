class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @user = User.find(params[:user_id])
    @booking = Booking.new
  end

  def create
    @user = User.find(params[:user_id])
    @booking = @user.bookings.new(booking_params)
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:format])
  end

  def confirmed
    @booking = Booking.find_by(id: params[:booking_id])
    @booking.confirmed!
    redirect_to user_bookings_path, status: 303
  end

  def cancelled
    @booking = Booking.find_by(id: params[:booking_id])
    @booking.cancelled!
    redirect_to user_bookings_path, status: 303
  end
  
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private
  def booking_params
    params.require(:booking).permit(:user_id, :event_id, :status, :reason, :capacity)
  end
end
