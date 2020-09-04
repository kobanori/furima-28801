Rails.application.routes.draw do
  resources :items, only: [:new, :create, :show, :edit, :update]
  root to: "items#index"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
