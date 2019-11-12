Rails.application.routes.draw do
    root to: 'pages#home'
    devise_for :users
    get '/home' => "horses#index", as: :user_root

    resources :users, only: [:show, :edit] do
      resources :horses, only: [:index, :show]
    end

    resources :horses, only: [:index, :show] do
      resources :reservations, only: [:new, :create]
    end

    namespace :admin do
      resources :horses, only: [:index, :new, :create]
    end

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
