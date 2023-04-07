Rails.application.routes.draw do

  resources :reservations, except: [:index]

  devise_for :users, controllers: { registrations: "registrations" }

  root "home#index"
  get 'contact', to: 'contact_form#new'
  post 'contact', to: 'contact_form#create'

  get "home/reservations", as: "reservations_current"
end
