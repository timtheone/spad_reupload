Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :credit_cards, only: [:index, :new, :create, :edit, :update] do
    member do
      patch 'close'
      patch 'activate'
      patch 'deactivate'
    end
  end

end
