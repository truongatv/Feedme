Rails.application.routes.draw do
  resources :image_comments
  get 'static_pages/home'

  resources :images
  root 'static_pages#home'
  

  devise_for :users do
  	get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/:id', :to => 'users#show', :as => :user
  end

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
