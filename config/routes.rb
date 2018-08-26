Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/show'
  resources :items
  devise_for :users
	root 'pages#index'
  get 'pages/show'
  resources :users, :only => [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
