Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'

  }

  root 'home#index'

  get "detail", to: "home#detail"
  get "candidate/:id", to: "home#candidate", as: "candidate"
  get "drive/:id", to: "home#drive", as: "drive"
  post "fillform/:id", to: "home#fillform", as: "fillform"
  get "admins", to: "home#admins", as: "admins"
  get "date/:data", to: "home#date", as: "date"
  get "way/:date", to: "home#way", as: "way"
  get "admin2/:id", to: "home#admin2", as: "admin2"
  post "admin3/:id", to: "home#admin3", as: "admin3"
  get "track/:id", to: "home#track", as: "track"
  get "result/:id", to: "home#result", as: "result"
  get "interinfo/:inter", to: "home#interinfo", as: "interinfo"

end
