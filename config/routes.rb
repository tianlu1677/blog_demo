Rails.application.routes.draw do

	root 'static_pages#home'

  get 'users/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :users
end
