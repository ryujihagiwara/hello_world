Rails.application.routes.draw do
  devise_for :learners

  resources :leraners, only: [:index, :show, :edit, :update]

  resources :posts

  resources :comments, only: [:create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
