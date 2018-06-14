Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :home
  resources :post

  resources :user, only: :show do
    collection do
      get :show
    end

    resources :follower
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
