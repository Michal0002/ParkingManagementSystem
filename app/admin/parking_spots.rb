ActiveAdmin.register ParkingSpot do
  permit_params :name, :available, :region_id
  menu label: 'Miejsca parkingowe'
  index title: proc{ "Miejsca parkingowe"}  do
    selectable_column
    column "Nazwa miejsca parkingowego", :name
    column "Dostępość", :available
    column "Region parkingowy", :region
    actions
  end
    filter :name, label: "Nazwa miejsca parkingowego"
    filter :available, label: "Dostępość"
    filter :region, label: "Region parkingowy"
    
    show do
      attributes_table do
        row "Nazwa miejsca parkingowego", &:name
        row "Dostępość", &:available
        row "Region parkingowy", &:region
      end
    end
  form do |f|
    f.inputs "Edytuj miejsce parkingowe" do
      f.input :name, label: "Nazwa miejsca parkingowego"
      f.input :available, label: "Dostępność"
      f.input :region, label: "Region parkingowy"
    end
    f.actions "aktualizuj"
  end
end
    

