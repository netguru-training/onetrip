class TripsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy, :join_trip]

  expose(:trip, attributes: :trip_params)
  expose(:trips)
  expose(:trip_by_code) { Trip.find_by_code(params[:trip_code]).first }
  expose(:categories) { trip.categories }
  
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
    if trip_by_code.save
      render :share_show, notice: 'You joined'
    else
      render :share_show, notice: 'Error'
    end
  end

  def create
    trip.owner = current_user

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
                                    :contributors_limit,
                                    :categories_ids => []
                                  )
    end
end
