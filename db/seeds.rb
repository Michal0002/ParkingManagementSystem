100.times do |n|
    ParkingSpot.create(name: "Spot_#{n+1}", region: "Parking A")
  end
  