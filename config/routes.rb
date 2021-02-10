Rails.application.routes.draw do


  get 'search/search'
  root to: 'homes#top'
  get '/about' => 'homes#about'

  devise_for :customers

  resources :items, only: [:show, :index, :new, :create]



  namespace :admin do
    get '/', to:'homes#top'
  end

  namespace :admin do
    resources :items, only: [:show, :index, :new, :create]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
