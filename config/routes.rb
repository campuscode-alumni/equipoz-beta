Rails.application.routes.draw do
	resources :equipament, only: [:new]
end
