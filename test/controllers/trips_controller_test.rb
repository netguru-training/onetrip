require 'test_helper'

class TripsControllerTest < ActionController::TestCase
  setup do
    @trip = trips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trip" do
    assert_difference('Trip.count') do
      post :create, trip: { description: @trip.description, end_latitude: @trip.end_latitude, end_longitude: @trip.end_longitude, end_time: @trip.end_time, owner_id: @trip.owner_id, start_latitude: @trip.start_latitude, start_longitude: @trip.start_longitude, start_time: @trip.start_time, title: @trip.title }
    end

    assert_redirected_to trip_path(assigns(:trip))
  end

  test "should show trip" do
    get :show, id: @trip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trip
    assert_response :success
  end

  test "should update trip" do
    patch :update, id: @trip, trip: { description: @trip.description, end_latitude: @trip.end_latitude, end_longitude: @trip.end_longitude, end_time: @trip.end_time, owner_id: @trip.owner_id, start_latitude: @trip.start_latitude, start_longitude: @trip.start_longitude, start_time: @trip.start_time, title: @trip.title }
    assert_redirected_to trip_path(assigns(:trip))
  end

  test "should destroy trip" do
    assert_difference('Trip.count', -1) do
      delete :destroy, id: @trip
    end

    assert_redirected_to trips_path
  end
end
