Rails.application.routes.draw do
  get '/bookings', to: 'bookings#new'
  resources :bookings, only: %i[new create show]
  resources :flights, only: %i[index]
  root 'flights#index'
end
