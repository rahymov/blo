Rails.application.routes.draw do
  

	root "pages#home"
  resources :articles

  get '/home', to: 'pages#home'
  get '/about', to: 'pages#about'

end
