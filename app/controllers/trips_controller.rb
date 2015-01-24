class TripsController < ApplicationController
  expose(:trip)
  expose(:trips)

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    trip = Trip.new(trip_params)

    if trip.save
      redirect_to trip, notice: 'Trip was successfully created.'
    else
      render :new
    end
  end

  def update
    if trip.update(trip_params)
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
                                    :owner_id, 
                                    :contributors_limit )
    end

end
