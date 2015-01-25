class TripsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy, :join_trip]

  expose(:trip, attributes: :trip_params)
  expose(:trips)
  expose(:trip_by_code) { Trip.find_by_code(params[:trip_code]).first }
  
  def index
  end

  def show
  end
  
  def share_show
  end
  
  def new
  end

  def edit
  end
  
  def join_trip
    trip_by_code.users << current_user
    binding.pry
    if trip_by_code.save
      redirect_to trip_by_code, notice: 'You joined'
    else
      redirect_to trip_by_code, notice: 'Error'
    end
  end

  def create
    trip = current_user.owned_trips.build(trip_params)
    if trip.save
      redirect_to trip, notice: 'Trip was successfully created.'
    else
      render :new
    end
  end

  def update
    if trip.save
      redirect_to trip, notice: 'Trip was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    trip.destroy
    redirect_to trips_url, notice: 'Trip was successfully destroyed.'
  end

  private
    def trip_params
      params.require(:trip).permit( :title, 
                                    :description, 
                                    :start_latitude, 
                                    :start_longitude, 
                                    :end_latitude, 
                                    :end_longitude, 
                                    :start_time, 
                                    :end_time, 
                                    :start_address,
                                    :end_address,
                                    :contributors_limit )
    end
end
