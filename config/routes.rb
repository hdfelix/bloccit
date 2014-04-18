Bloccit::Application.routes.draw do
  
  get "comments/new"
  devise_for :users
	resources :users, only: [:update]

	resources :topics do
		resources :posts, except: [:index] do
			resources :comments, only: [:create, :destroy]
		end
	end

  get "welcome/about"  #Bloc has:  get 'about' => 'welcome#about'

	root to: 'welcome#index'
end
