Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { registrations: :registrations }
  resources :users do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, except: [:new, :create]
  get "/profile", to: "pages#profile"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
