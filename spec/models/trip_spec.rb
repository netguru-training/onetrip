require 'rails_helper'
require 'shoulda-matchers'

describe Trip do 
  it 'has valid factory' do
    expect( create(:trip) ).to be_valid
  end
  
  describe '.without_id' do 
    it 'returns trip attributes without id' do
      expect( create(:trip).without_id.id ).to be_nil
    end
  end
  
  describe '.from_past?' do
    it 'return true if trip is form past' do
      expect( create(:trip, start_time: '1999-01-31 07:17:00').from_past? ).to be(true)
    end
    it 'returns false if trip is from future' do
      expect( create(:trip, start_time: Time.now + (2*7*24*60*10), end_time: Time.now + (2*7*24*60*60)).from_past? ).to be(false)
    end
  end
  
  describe 'dates_chronological' do
    it 'validates start_time > end_time' do
      expect( build(:trip, start_time: '2000-01-31 07:17:00', end_time: '1999-01-31 07:17:00') ).not_to be_valid
    end
  end
  
  describe 'correct_datetime validation' do
    it { should_not allow_value('bar').for(:start_time).with_message("must be a valid datetime") }
    it { should_not allow_value('foo').for(:end_time).with_message("must be a valid datetime") }
    it { should allow_value('2000-01-31 07:17:00').for(:start_time) }
    it { should allow_value('2000-01-31 07:17:00').for(:end_time) }
  end
  
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should accept_nested_attributes_for(:categories) }
  
end