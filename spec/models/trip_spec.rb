require 'rails_helper'

describe Trip do 
  it 'has valid factory' do
    expect( create(:trip) ).to be_valid
  end
  it '.without_id' do 
    expect(create(:trip).without_id.id).to be_nil
  end
  it 'validates dates_chronological' do
    expect(build(:trip, end_time: '2000-01-31 07:17:00')).not_to be_valid
  end
end

