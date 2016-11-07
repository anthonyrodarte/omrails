Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
      get 'sign_in', to: 'devise/sessions#new'
      delete 'sign_out', to: 'devise/sessions#destroy'
      get 'sign_up', to: 'devise/registrations#new'
  end

  get 'feed', to: 'feed#show'

  resources :users, only: :show, param: :username do
    member do
      post 'follow', to: 'follows#create'
      delete 'unfollow', to: 'follows#destroy'
    end
  end
  resources :reviews do
    member do
      post 'vote', to: 'votes#create'
      delete 'unvote', to: 'votes#destroy'
    end
  end
  resources :tweets
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact_us', to: 'pages#contactus'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
