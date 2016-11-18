Rails.application.routes.draw do
	resources :equipment, only: [:new, :create, :show]
  resources :contracts, only: [:index, :new, :create, :show]
  resources :customers, only: [:new, :create, :show]
end
