ActiveAdmin.register User, as: 'Employee' do
    menu label: 'Pracownicy', parent: 'Użytkownicy', priority: 1
    actions :all, except: [:new, :create, :edit, :update, :destroy]
    config.filters = false
    
    controller do
      def scoped_collection
        User.where(role: 1)
      end
    end 

    index do
      selectable_column
      column "Adres email", :email
      column "Imię", :first_name
      column "Nazwisko", :last_name
      column "Telefon", :phone
      column "Typ konta", :role
      actions
    end


  end
  