FactoryGirl.define do 
  factory :trip do
    title 'Lorem'
    description 'Ipsum dolot sit'
    start_time '2015-01-30 07:22:00'
    end_time '2015-01-31 07:22:00'
    contributors_limit 2
    start_address 'Wrocław'
    end_address 'Wrocław'
    association :owner, factory: :user
  end
end