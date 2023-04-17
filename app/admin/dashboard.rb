require "chartkick"

ActiveAdmin.register_page "Dashboard" do
  content do
    columns do
      column do
        panel "Wykres zajętości miejsc parkingowych" do
          data = ParkingSpot.group(:available).count
          data = { "Wolne" => data[true], "Zajęte" => data[false] }
          pie_chart data, library: {
            colors: ["#55efc4", "#ff7675"],
            donut: true,
            title: { text: "Zajętość miejsc parkingowych", align: "center" }
          }
        end
      end
      column do
        panel "Liczba użytkowników systemu" do
          data = User.group(:role).count
          data = { "Klienci" => data['client'], "Pracownicy" => data['employee'] }
          bar_chart data, library: {
            colors: ["#55efd4", "#ff7622"], 
            title: { text: "Liczba użytkowników systemu", align: "center" }
          }
        end
      end
    end
  end
end