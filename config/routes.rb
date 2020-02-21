Rails.application.routes.draw do
  root to: 'pages#home'
  #root to: 'pets#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pets do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :destroy] do
    resources :reviews, only: [:create]
  end
end
