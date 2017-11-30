Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :restaurants, only: [:index, :show]
  root "restaurant#index"


  namespace :admin do
    root "restaurant#index"
    resources :restaurants
  end
end
