Rails.application.routes.draw do
  resources :bookings, only: %i[new create]
  get '/bookings', to: 'bookings#new'
  resources :flights, only: %i[index]

  root 'flights#index'
end
