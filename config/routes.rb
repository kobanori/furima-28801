Rails.application.routes.draw do
  resources :items do
    resources :orders, only:[:index, :new, :create]
    resources :deliveries, only:[:create]
  end
  root to: "items#index"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
