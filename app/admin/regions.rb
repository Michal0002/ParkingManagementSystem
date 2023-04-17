ActiveAdmin.register Region do
  permit_params :name
  menu label: 'Regiony parkingowe'
  index do
    selectable_column
    column "ID regionu", :id
    column "Nazwa regionu", :name
    actions
  end
  filter :name, label: "Nazwa regionu"
  show do
    attributes_table do
      row "Nazwa regionu", &:name
    end
  end
end
