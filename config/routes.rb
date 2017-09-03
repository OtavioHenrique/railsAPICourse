Rails.application.routes.draw do
  
  resources :auths, only: [:create]
  resources :kinds

  resources :contacts do
    resource :kind, only: [:show]
    resource :kind, only: [:show], path: "relationships/kind"

    resource :phones, only: [:show, :update]
    resource :phones, only: [:show, :update], path: "relationships/phones"
    
    resource :phone, only: [:create, :update, :destroy]
    resource :phone, only: [:create, :update, :destroy], path: "relationships/phones"

    resource :address, only: [:show, :update, :create, :destroy]
    resource :address, only: [:show, :update, :create, :destroy], path: "relationships/address"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
