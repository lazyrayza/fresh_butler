class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :update, :destroy, :edit]

  def index
    #need authorization for specific user to view his bookings
    @user = User.find(params[:user_id])
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def update
    if @bookings.update(booking_params)
      redirect_to bookings_path(@bookings), notice: 'Booking was updated!'
    else
      render :new
    end
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path(@booking), notice: 'Booking has been made!'
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @booking.destroy
    redirect_to user_session_path(@booking.user)
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :user_id)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
