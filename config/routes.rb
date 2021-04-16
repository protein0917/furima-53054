Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items, only: [:edit, :show, :update, :destroy, :new]

  resources :items do
    resources :manegements, only: [:index, :create]
  end

end
