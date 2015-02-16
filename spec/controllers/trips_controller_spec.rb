require 'rails_helper'

describe TripsController, type: :controller do

  let!(:user) { create(:user) }
  let(:trip) { create(:trip) }
  let(:task) { create(:task) }
    
  describe 'POST #mark_as_done' do
    
    let(:method){ post :mark_as_done, task_id: task.id, trip_code: trip.trip_code }
    
    context 'when user is not signed in' do
      it 'does not create CompletedTripTask' do
        expect{ method }.not_to change(CompletedTripTask, :count)
      end
    end
    
    context 'when user is signed in' do
      before do
        sign_in user
      end
      it 'creates CompletedTripTask' do
        expect{ method }.to change(CompletedTripTask, :count).by(1)
      end
      it 'redirects when successfull' do
        expect( method ).to redirect_to share_trip_path(trip.trip_code)
      end
    end
  end
  
  describe 'POST #join_trip' do
    before do
      sign_in user
    end

    let(:method) { post :join_trip, trip_code: trip.trip_code }
    
    context 'with valid params' do
      it 'creates new TripMembership' do
        expect{ method }.to change(TripMembership, :count).by(1)
      end
      it 'increments user trips' do
        expect{ method }.to change(user.trip_memberships, :count).by(1)
      end
      it 'redirects when successfull' do
        expect( method ).to redirect_to share_trip_path(trip.trip_code)
      end
    end
  end
  
  describe 'GET #renew' do
    it 'loads form with data' do
      get :renew, id: trip
      expect(trip).to eq trip
    end
  end
  
  describe 'POST #renew' do
    it 'creates new trip' do
      expect{ post :renew, id: trip }.to change(Trip, :count).by(1)
    end
  end
end

