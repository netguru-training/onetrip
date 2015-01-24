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
    if trip.users.count >= trip.contributors_limit || current_user == trip.first.owner
      redirect_to trip, notice: "You can't join this trip"
    else
      trip.trip_memberships.build(user_id: current_user.id)
      if trip.save
        redirect_to trip, notice: 'You joined'
      else
        redirect_to trip, notice: 'Error'
      end
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
