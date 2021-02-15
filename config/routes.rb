Rails.application.routes.draw do


  root to: 'homes#top'
  get '/about' => 'homes#about'
  get 'search/search'

  devise_for :customers

  resources :customers, only: [:upatem, :show, :edit]
  post 'customers/unsubscribe' => 'customers#unsubscribe'
  get 'customers/withdraw' => 'customers#withdraw'
  

  resources :items, only: [:show, :index, :new, :create]

  
  resources :orders, only: [:show, :index, :new, :create] do
    collection do
      post :confirm
    end
  end
  get 'orders/thanks' => 'orders#thanks'

  
  resources :cart_items, except: [:new, :edit, :show]
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'

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
