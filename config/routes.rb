Rails.application.routes.draw do
	resources :equipment, only: [:new]
end
