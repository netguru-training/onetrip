FactoryGirl.define do 
  factory :completed_trip_task do
    trip
    task
    user
  end 
end