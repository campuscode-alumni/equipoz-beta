Rails.application.routes.draw do
	resources :equipment, only: [:new, :create, :show]

	resources :categories, only: [:new, :create, :show]

  resources :customers, only: [:new, :create, :show]

  resources :contracts, only: [:index, :new, :create, :show] do
    member do
      get 'delivery_receipt', to: 'delivery_receipts#show'
      post 'delivery_receipt', to: 'delivery_receipts#create'
    end
  end
end
