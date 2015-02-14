class TripsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy, :join_trip, :mark_as_done]

  expose(:trip, attributes: :trip_params)
  expose(:trips)
  expose(:trip_by_code) { Trip.find_by_code(params[:trip_code]).first }
  expose(:categories) { trip.categories }
  expose(:stored_category_ids)
  expose(:message)
  
  def index
    self.stored_category_ids = params[:category_ids] || []

    self.trips = Trip.search(stored_category_ids).order("start_time ASC").page(params[:page]).per_page(5)
    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  def show
  end

  def share
  end
  
  def my_trips
  end
  
  def renew
  end
  
  def new
  end

  def edit
  end

  def mark_as_done
    CompletedTripTask.create(task_id: params[:task_id], trip_id: params[:trip_id], user_id: current_user.id)
    redirect_to share_trip_path(trip_code: trip_by_code.trip_code), notice: 'Task marked as done'
  end

  def join_trip
    trip_by_code.trip_memberships.build(user: current_user)

    if trip_by_code.save
      redirect_to share_trip_path(trip_code: trip_by_code.trip_code), notice: 'You joined'
    else
      flash[:danger] = 'You cannot join this trip'
      redirect_to share_trip_path(trip_code: trip_by_code.trip_code)
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
                                    :category_ids => []
                                  )
    end

    def stored_category_ids
      session[:category_ids] || []
    end

    def stored_category_ids=(ids)
      session[:category_ids] = ids
    end
end
