Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	root 'welcome#home'

	get '/signup' => 'users#new'
	get '/login' => 'logins#new'
	post '/login' => 'logins#create'
	delete '/logout' => 'logins#destroy'

  get '/auth/:provider/callback' => 'logins#omniauth'
 
  resources :reviews
  resources :beers do
  	resources :reviews, only: [:new, :index]
  end
  resources :breweries
  resources :users
  
end

