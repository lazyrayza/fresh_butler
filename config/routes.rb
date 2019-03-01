Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users, controllers: { registrations: :registrations }

  resources :users do
    resources :bookings, only: [:new, :create]
    resources :reviews, except: [:destroy, :edit, :update, :show]
  end
  resources :reviews, only: [:show]
  resources :bookings, except: [:new, :create]
  get "/profile", to: "pages#profile"
end
