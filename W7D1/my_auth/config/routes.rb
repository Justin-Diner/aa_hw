Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
	root "users#new"
  resources :users, only: %i(create new show)
	resources :session
end
