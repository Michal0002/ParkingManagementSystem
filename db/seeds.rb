Region.create!(name: "Parking A")
ParkingSpot.create!(name: "Spot_A01", available: true, region_id: 1)
User.create!(email: "michal2000@wp.pl", password: "abcdefg", first_name: 'Michal', last_name: 'Kasperek', phone: '123456789', role: 1 )
100.times do |n|
    ParkingSpot.create(name: "Spot_#{n+1}", region: "Parking A")
  end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Region.create!(name: "Parking B")
ParkingSpot.create!(name: "Spot_B101", available: true, region_id: 2)
100.times do |n|
    ParkingSpot.create(name: "Spot_#{n+1}", region: "Parking B")
  end
  AdminUser.create!(email: 'admin1@example.com', password: 'password', password_confirmation: 'password1')
