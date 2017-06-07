Rails.application.routes.draw do
  devise_for :users, controllers: {
  invitations: "users/invitations"
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


  resources :users, only: [:create, :new, :index, :show, :edit, :update, :destroy]
  post '/users/:id/reinvite', to: 'users#reinvite', as: 'reinvite'


end
