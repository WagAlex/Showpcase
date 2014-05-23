class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :destroy]
  before_action :visible_bookings, only: [:index]
  before_action :authenticate_user!

  def index
  end

  def create
    booking_params = params.require(:booking).permit(:shop_id, :user_id, :start_date, :end_date)
    start_date = Date.parse(params[:booking][:start_date])
    end_date = Date.parse(params[:booking][:end_date])
    duration = (end_date - start_date).to_i + 1
    price = Shop.find(params[:booking][:shop_id]).price * duration
    booking_params[:price] = price
    @booking =  current_user.bookings.build(booking_params)
    @booking.price = price
    authorize @booking

    if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to root_path
    end
  end

  def show
    authorize @booking
    @shop = @booking.shop
  end

  def update
    booking_params = params.require(:booking).permit(:start_date, :end_date, :shop_id)
    start_date = Date.parse(params[:booking][:start_date])
    end_date = Date.parse(params[:booking][:end_date])
    duration = (end_date - start_date).to_i + 1
    price = @booking.shop.price * duration
    booking_params[:price] = price
    authorize @booking

    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :show
    end
  end

  def destroy
    authorize @booking
    @booking.destroy!
    redirect_to bookings_path
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def visible_bookings
      if current_user.admin?
        @bookings = Booking.all
      else
        @bookings = Booking.where(user_id: current_user.id)
      end
    end
end
