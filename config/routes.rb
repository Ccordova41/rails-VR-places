Rails.application.routes.draw do
  resources :user_comments
  resources :user_experiences
  resources :experience_categories
  resources :locations, only [:new, :create, :show]
  resources :categories
  resources :experiences
  resources :venues
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "application#hello"

  get '/auth/facebook/callback' => 'sessions#create'

end
