Rails.application.routes.draw do
  resources :image_comments
  get 'static_pages/home'

  resources :images
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

  resources :relationships, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end