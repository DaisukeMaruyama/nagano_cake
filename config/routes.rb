Rails.application.routes.draw do


  namespace :admin do
    get 'cutomers/index'
    get 'cutomers/show'
    get 'cutomers/edit'
    get 'cutomers/update'
  end
  namespace :admin do
    get 'order_details/update'
  end
  get 'search/search'
  root to: 'homes#top'
  get '/about' => 'homes#about'

  devise_for :customers

  resources :items, only: [:show, :index, :new, :create] 




  namespace :admin do
    get '/', to:'homes#top'
  end

  namespace :admin do
    resources :items, only: [:show, :index, :new, :create, :edit, :update]
  end
  
  namespace :admin do
    resources :genres, only: [:update, :index, :edit, :create]
  end
  
  namespace :admin do
    resources :customers, only: [:update, :index, :edit, :show]
  end
  
  namespace :admin do
    resources :orders, only: [:update, :show]
  end
  
  namespace :admin do
    resources :order_details, only: [:update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
