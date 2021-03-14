Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  
  resources :items do
    member do
      resources :purchase_records, only: [:index, :create]
    end
  end
end
