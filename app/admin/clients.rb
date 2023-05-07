ActiveAdmin.register User, as: 'Customer' do
    menu label: 'Klienci', parent: 'Użytkownicy', priority: 2
    actions :all, except: [:new, :create, :edit, :update, :destroy]
    config.filters = false
    
    controller do
      def scoped_collection
        User.where(role: 0)
      end
    end

    index title: proc{"Klienci"}  do
      selectable_column
      column "Adres email", :email
      column "Imię", :first_name
      column "Nazwisko", :last_name
      column "Telefon", :phone
      column "Typ konta", :role
      column "Użytkownik od", :created_at do |user|
        user.created_at.strftime("%d %B %Y")
      end
      actions
    end
  end
  