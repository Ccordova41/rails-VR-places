Rails.application.routes.draw do
devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "application#hello"
  get '/hello', to: 'application#hello'
  get '/venues/best_venues', to: 'venues#best', as: 'best_experiences'
  get '/current_user', to: 'users#get_current'
  get '/venues/:id/experiences', to: 'venues#collection'


  resources :categories, only: [:index, :new, :create, :show, :destroy] do
    resources :experiences, only: [:index]
  end

  resources :experiences, only: [:create, :update]
  resources :venues, only: [:new, :create, :edit, :update, :destroy]
  resources :venues, only: [:show] do
    resources :experiences
  end

  resources :experiences, only:[:show] do
  resources :user_comments, only: [:index, :new, :create, :edit, :update, :destroy]
end


  resources :user_experiences, only: [:create, :destroy]
  resources :users, only: [:show]
  resources :locations, only: [:new, :create, :show]

end
