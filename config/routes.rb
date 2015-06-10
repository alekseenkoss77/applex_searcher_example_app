Rails.application.routes.draw do
  resources :devices, except: [:destroy, :update]
  root 'devices#index'
end
