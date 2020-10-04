Rails.application.routes.draw do
  devise_for :learners

  root 'homes#top'
  get '/homes/about' => 'homes#about'

  resources :learners, only: [:index, :show, :edit, :update]

  resources :posts do
  resources :comments, only: [:create, :edit, :update, :destroy]
  resource :favorites, only: [:create, :destroy]
  end

  post '/follow/:id' => 'relationships#follow', as: 'follow'
  post '/unfollow/:id' => 'relationships#unfollow', as: 'unfollow'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
