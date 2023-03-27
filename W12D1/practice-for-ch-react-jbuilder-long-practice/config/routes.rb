Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
	namespace :api, defaults: { format: :json } do
		resources :guests, only: [:show, :index] do 
				resources :gifts, only: [:index]
		end 
		resources :gifts, only: [:show]
		resources :parties, only: [:show, :index]
	end
end