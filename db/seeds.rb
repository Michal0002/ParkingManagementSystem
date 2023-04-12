100.times do |n|
    ParkingSpot.create(name: "Spot_#{n+1}", region: "Parking A")
  end
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?