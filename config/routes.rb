Rails.application.routes.draw do



  get 'cart_items/index'
  get 'cart_items/create'
  get 'cart_items/destroy'
  get 'cart_items/destroy_all'
  get 'cart_items/update'
  root to: 'homes#top'
  get '/about' => 'homes#about'
  get 'search/search'

  devise_for :customers


  resources :customers

  resources :items, only: [:show, :index, :new, :create]
  
  resources :cart_items

  namespace :admin do
    get 'cutomers/index'
    get 'cutomers/show'
    get 'cutomers/edit'
    get 'cutomers/update'
  end

  namespace :admin do
    get 'order_details/update'
  end


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
