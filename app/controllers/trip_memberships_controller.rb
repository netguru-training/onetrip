class TripMembershipsController < ApplicationController
  before_filter :check_if_trip_admin
  expose(:trip_membership)

  def accept
    trip_membership.accept!
    redirect_to edit_trip_path(trip_membership.trip), notice: 'Accepted!'
  end

  def reject
    trip_membership.reject!
    redirect_to edit_trip_path(trip_membership.trip), notice: 'Rejected!'
  end

  private
  def check_if_trip_admin
    unless trip_membership.trip.owner == current_user
      redirect_to :root, notice: 'You shall not pass!'
    end
  end
end
