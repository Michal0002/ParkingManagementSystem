ActiveAdmin.register Reservation do
  permit_params :reservation_date, :reservation_time, :status, :user_id, :parking_spot_id, :duration, :license_plate
  menu label: 'Bieżące rezerwacje'
  index title: proc{ "Bieżące rezerwacje"} do
    selectable_column
    column "Rezerwacja na dzień", :reservation_date
    column "Status rezerwacji", :status
    column "Użytkownik", :user
    column "Miejsce parkingowe", :parking_spot
    column "Numer tablicy rejestracyjnej", :license_plate
  end
end
