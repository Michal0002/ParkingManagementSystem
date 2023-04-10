Rails.application.routes.draw do

  resources :reservations

  devise_for :users, controllers: { registrations: "registrations" }

  root "home#index"
  get 'contact', to: 'contact_form#new'
  post 'contact', to: 'contact_form#create'

  get "home/reservations", as: "reservations_history"
  get "home/reservations_current", as: "reservations_current"
  get 'get_parking_spots', to: 'reservations#get_parking_spots'
  delete 'reservations/:id', to: 'reservations#destroy', as: 'delete_reservation'
  get 'reservations/:id/activate', to: 'reservations#activate', as: 'activate_reservation'

end
