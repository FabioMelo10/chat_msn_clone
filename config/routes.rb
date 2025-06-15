Rails.application.routes.draw do
  devise_for :users

  resources :conversations, only: [:index, :create, :show] do
    resources :messages, only: [:create]
  end

  root 'conversations#index'
end
