Rails.application.routes.draw do

	root "pages#home"
  resources :articles
  resources :users, except: [:new]

  get '/home', to: 'pages#home'
  get '/about', to: 'pages#about'
  get 'signup', to: 'users#new'
end
