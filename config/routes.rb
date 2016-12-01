Rails.application.routes.draw do

  root to: 'home#index'

	resources :equipment, only: [:index, :new, :create, :show]

	resources :categories, only: [:new, :create, :show]

  resources :customers, only: [:new, :create, :show]

	resources :category_amounts, only: [:new, :create, :show]

  resources :contracts, only: [:index, :new, :create, :show] do
		resources :return_receipts, only: [:new, :create]

    member do
      get 'delivery_receipt', to: 'delivery_receipts#show'
      post 'delivery_receipt', to: 'delivery_receipts#create'

			get 'return_receipt', to: 'return_receipts#show'

      get 'prices', to: 'contract_prices#edit'
      post 'prices', to: 'contract_prices#update'

      put 'finish', to: 'finish_contracts#update'
    end
  end
end
