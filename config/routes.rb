Bloccit::Application.routes.draw do
  
  get "comments/new"
  devise_for :users
	resources :users, only: [:show, :update]

	resources :topics do
		resources :posts, except: [:index] do
			resources :comments, only: [:create, :destroy]
			get '/up-vote', to: 'votes#up_vote', as: :up_vote
			get '/down-vote', to: 'votes#down_vote', as: :down_vote
			resources :favorites, only: [:create, :destroy]
		end
	end

  get "welcome/about"  #Bloc has:  get 'about' => 'welcome#about'

	root to: 'welcome#index'
end
