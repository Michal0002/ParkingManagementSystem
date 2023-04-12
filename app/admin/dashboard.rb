require "chartkick"

ActiveAdmin.register_page "Dashboard" do
  content do
    columns do
      column do
        panel "Wykres zajętości miejsc parkingowych" do
          data = ParkingSpot.group(:status).count
          pie_chart data, library: { legend: { position: 'bottom' } }
        end
      end
    end
  end
end
