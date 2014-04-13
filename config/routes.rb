Bloccit::Application.routes.draw do
  
  devise_for :users
	resources :posts
	
  get "welcome/about"

	root to: 'welcome#index'
end
