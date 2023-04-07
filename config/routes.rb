Rails.application.routes.draw do

  resources :reservations, except: [:index]

  devise_for :users, controllers: { registrations: "registrations" }

  root "home#index"

end
