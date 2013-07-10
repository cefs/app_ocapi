AppOcapi::Application.routes.draw do
  resources :advertisings

  devise_for :users

  root to: "home#index"
end
