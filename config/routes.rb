Bloccit::Application.routes.draw do
  
	resources :posts
	
  get "welcome/about"

	root to: 'welcome#index'
end
