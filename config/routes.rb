Rails.application.routes.draw do
  devise_for :users, controllers: {
    invitations: "users/invitations",
    registrations: "users/registrations"
  }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :credit_cards, only: [:index, :new, :create, :edit, :update] do
    member do
      patch 'close'
      patch 'activate'
      patch 'deactivate'
    end
  end

  resources :categories, only: [:index, :new, :create, :edit, :update, :destroy] do
    member do
      patch 'activate'
      patch 'deactivate'
    end
  end

  resources :expenses, only: [:index, :create, :show]

  resources :users, only: [:create, :new, :index, :show, :edit, :update, :destroy]
  post '/users/:id/reinvite', to: 'users#reinvite', as: 'reinvite'


end
