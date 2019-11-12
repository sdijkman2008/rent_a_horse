Rails.application.routes.draw do
  Rails.application.routes.draw do
    devise_for :users
    root to: 'pages#home'

    resources :users, only: [:show, :edit] do
      resources :horses, only: [:index, :show]
    end

    resources :horses, only: [:index, :show, :new, :create] do
      resources :reservations, only: [:new, :create]
    end

    namespace :admin do
      resources :horses, only: [:index, :new, :create]
    end

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
