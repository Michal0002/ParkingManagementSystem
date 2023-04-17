# app/admin/users.rb

ActiveAdmin.register User do
  permit_params :email, :password, :first_name, :last_name, :phone, :role

  # Dodanie kolumn do tabeli
  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :phone
    actions
  end

  # Dodanie pól filtrów
  filter :first_name
  filter :last_name
  filter :email
  filter :phone

  # Definicja akcji dla przycisków akcji
  action_item :view, only: :show do
    link_to 'Edytuj', edit_admin_user_path(user)
  end

  action_item :view, only: :show do
    link_to 'Usuń', admin_user_path(user),
            method: :delete,
            data: { confirm: 'Czy na pewno chcesz usunąć tego użytkownika?' }
  end
end
