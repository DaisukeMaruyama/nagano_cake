Rails.application.routes.draw do


  root to: 'homes#top'
  get '/about' => 'homes#about'
  get 'search/search'

  devise_for :customers, controllers: {
  sessions: 'devise/customers/sessions',
  registrations: 'devise/customers/registrations' ,
  passwords: 'devise/customers/passwords'
  }

  get 'customers/unsubscribe' => 'customers#unsubscribe'
  patch 'customers/withdraw' => 'customers#withdraw'
  resources :customers, only: [:update, :show, :edit]

  resources :items, only: [:show, :index, :new, :create]


  get 'orders/thanks' => 'orders#thanks'
  resources :orders, only: [:show, :index, :new, :create] do
    collection do
      post :confirm
    end
  end

  #destroy_allを先に記述しないとエラーが起こる
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :cart_items, except: [:new, :edit, :show]

  resources :deliveries, only: [:edit, :update, :index, :create, :destroy]


  devise_for :admins, controllers: {
  sessions: 'devise/admins/sessions'
  }

  namespace :admin do
    get 'order_details/update'
  end


  namespace :admin do
    get '/', to:'homes#top'
  end



  namespace :admin do
    resources :items, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  end

  namespace :admin do
    resources :genres, only: [:update, :index, :edit, :destroy, :create]
  end

  namespace :admin do
    resources :customers, only: [:update, :index, :edit, :show]
  end

  namespace :admin do
    resources :orders, only: [:update, :show, :index]
  end

  namespace :admin do
    resources :order_details, only: [:update]
  end
  
  namespace :admin do
    get 'search/search'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
