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
  get "date/:data", to: "home#date", as: "date"
  get "way/:date", to: "home#way", as: "way"
  get "admin2/:id", to: "home#admin2", as: "admin2"
  post "admin3/:id", to: "home#admin3", as: "admin3"
  get "track/:id", to: "home#track", as: "track"
  get "result/:id", to: "home#result", as: "result"
  get "interinfo/:inter", to: "home#interinfo", as: "interinfo"
  get "update_user_data/:id", to: "home#update_user_data", as: "update_user_data"
  post "admin_update/:id", to: "home#admin_update", as: "admin_update"
  get "riview/:id", to: "home#riview", as: "riview"
  post "riview_update/:id", to: "home#riview_update", as: "riview_update" 
  get "create_drive", to: "home#create_drive", as: "create_drive"
  post "drive_save", to: "home#drive_save", as: "drive_save"
  get "drive_show/:id", to: "home#drive_show", as:"drive_show"
  get "access_date", to: "home#access_date", as: "access_date"
  get "name/:date", to: "home#name", as: "name"
  delete "candidate/:date",to: "home#deleter", as: "deleter"
  get "information", to: "home#information", as: "information"
  get "del/:id", to: "home#del", as: "del"
end
