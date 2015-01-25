user = User.create(
  email: 'user@example.com',
  password: 'aaaaaaaa',
  password_confirmation: 'aaaaaaaa',
  name: 'John Doe'
)

%w( Summer Winter Sea Mountains ).each do |name|
  Category.create(name: name)
end

[
  { start_address: "Kraków", end_address: "Wrocław" },
  { start_address: "Paris", end_address: "Marocco" },
  { start_address: "Berlin", end_address: "Roma" }
].each_with_index do |data, i|
  trip = Trip.new(
    title: data[:start_address].downcase,
    description: "#{ data[:start_address].capitalize } trip.",
    start_address: data[:start_address],
    end_address: data[:end_address],
    start_time: DateTime.now + i.days,
    end_time: DateTime.now + (i + rand(5)).days,
    contributors_limit: i + rand(3) + 1
  )
  trip.categories << Category.find(i + 1)
  trip.generate_code
  trip.owner = user
  trip.save!
end