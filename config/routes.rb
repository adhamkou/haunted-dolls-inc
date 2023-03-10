Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/', to: 'pages#home', as: :home
  resources :dolls, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [] do
    resources :reviews, only: [:new, :create]
  end
  # resources :bookings, only: [:my_bookings, :set_status]
  get '/my_bookings', to: 'bookings#my_bookings'
  get 'bookings/:id/status', to: 'bookings#status', as: :status
  post 'bookings/:id/set_status', to: 'bookings#set_status', as: :set_status
end
