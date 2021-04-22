Rails.application.routes.draw do
  #resources :apis

  get 'apis/news', to: 'apis#index'
  get 'apis/:fecha1/:fecha2', to: 'apis#show'
  post 'apis/tweets', to: 'apis#create'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :tweets do
    post 'like', to: 'tweets#like'
    post 'retweet', to: 'tweets#retweet'
  end

  get '/tweets/hashtag/:name', to:'tweets#hashtags'

  devise_for :users, controllers: {registrations: 'users/registrations'}
  root to: "tweets#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end