Rails.application.routes.draw do
  root "homes#index"
  resources :homes
  resources :users do
    resources :bookings do
      put "cancelled"
      put "confirmed"
    end
  end

  resources :roles
  resources :categories
  resources :cities
  resources :locations
  resources :events
  resources :notifications

  get "/bookings", to: "bookings#index", as: "bookings"
  get "/bookings/show", to: "bookings#show", as: "bookings_show"
  
end
