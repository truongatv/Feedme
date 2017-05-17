Rails.application.routes.draw do
  
  resources :image_comments do
    member do
      get :live_update
    end
  end
  get 'static_pages/home'

  resources :images do
    resources :likes
  end
  root 'static_pages#home'
  

  devise_for :users, controllers: {sessions: 'sessions'} do
  	get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/:id', :to => 'users#show', :as => :user
  end

  resources :users do
  	member do
  		get :following, :followers
  	end
  end

  get 'live_search' => 'users#live_search'

  resources :relationships, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end