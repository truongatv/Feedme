Rails.application.routes.draw do
  resources :images
  root 'static_pages#home'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
