Rails.application.routes.draw do
  devise_for :learners

  root 'homes#top'
  get '/homes/about' => 'homes#about'

  resources :learners, only: [:index, :show, :edit, :update] do
    get '/following' => 'relationships#following', as: 'following'
    get '/follower' => 'relationships#follower', as: 'follower'
  end

  resources :posts do
  resources :comments, only: [:create, :edit, :update, :destroy]
  resource :favorites, only: [:create, :destroy]
  end

  resources :notifications, only: [:index]
  delete '/notifications/destroy_all' => 'notifications#destroy_all', as: 'destroy_all'


  get '/questions' => 'posts#question', as: "question"
  get '/tweets' =>'posts#tweet', as: "tweet"

  post '/follow/:id' => 'relationships#follow', as: 'follow'
  post '/unfollow/:id' => 'relationships#unfollow', as: 'unfollow'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
