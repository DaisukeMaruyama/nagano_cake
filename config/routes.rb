Rails.application.routes.draw do


  root to: 'homes#top'
  get '/about' => 'homes#about'

  devise_for :customers

  resources :items, only: [:show, :index]



  namespace :admin do
    get '/', to:'homes#top'
  end

  namespace :admin do
    resources :items
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
