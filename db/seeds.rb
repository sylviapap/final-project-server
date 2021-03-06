[
	{name: "Fever", seriousness: "serious"},
	{name: "Cough", seriousness: "serious"},
	{name: "Shortness of breath", seriousness: "emergency", is_emergency: true},
	{name: "Unconsciousness", seriousness: "emergency", is_emergency: true},
	{name: "Not responding normally", seriousness: "emergency", is_emergency: true},
	{name: "Symptoms quickly worsening", seriousness: "emergency", is_emergency: true},
	{name: "Fever between 37.5°C and 38°C (99.5°F and 100.4°F)", seriousness: "serious"},
	{name: "Fever between 38°C and 40°C (100.4°F and 104°F)", seriousness: "serious"},
	{name: "Fever over 40°C (104°F)", seriousness: "emergency", is_emergency: true},
	{name: "Fever not measured", seriousness: "normal"},
	{name: "Rapid breathing", seriousness: "emergency", is_emergency: true},
	{name: "Coughing up blood", seriousness: "emergency", is_emergency: true},
	{name: "Fatigue", seriousness: "normal"},
	{name: "Muscle pain", seriousness: "normal"},
	{name: "Chills", seriousness: "normal"},
	{name: "Headache", seriousness: "normal"},
	{name: "Diarrhea", seriousness: "normal"},
	{name: "Nausea", seriousness: "normal"},
	{name: "Sore throat", seriousness: "normal"}
].each do |symptom|
	Symptom.find_or_create_by(name: symptom[:name], seriousness: symptom[:seriousness], is_emergency: !!symptom[:is_emergency])
end

20.times do
  user = User.create(first_name: Faker::Name.first_name, last_name: "test_user", password: "password", password_confirmation: "password", email: Faker::Internet.email)
  3.times do 
    ReportedSymptom.create(user: user, symptom: Symptom.all.sample)
  end
end

[
  {title: "New York", latitude: 40.7128, longitude: -74.0060},
  {title: "Chicago", latitude: 41.8781, longitude: -87.6298},
  {title: "Tokyo", latitude: 35.6804, longitude: 139.7690},
  {title: "Cairo", latitude: 30.0444, longitude: 31.2357},
  {title: "Paris", latitude: 48.8566, longitude: 2.3522},
  {title: "Sao Paolo", latitude: -23.5505, longitude: -46.6333},
  {title: "Sydney", latitude: -33.8688, longitude: 151.2093},
  {title: "Toronto", latitude: 43.6532, longitude: -79.3832},
  {title: "Mexico City", latitude: 19.4326, longitude: -99.1332},
  {title: "Moscow", latitude: 55.7558, longitude: 37.6173}
].each do |place|
  MapMarker.create(latitude: place[:latitude], longitude: place[:longitude], title: "[Example] #{place[:title]}", message: Faker::Lorem.sentence, creator: User.all.sample)
end

20.times do
  Comment.create(content: Faker::Lorem.sentence, user: User.all.sample, map_marker: MapMarker.all.sample)
end