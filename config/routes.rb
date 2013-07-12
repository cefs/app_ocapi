AppOcapi::Application.routes.draw do
  resources :advertisings do
    member do
      put "approved" => "advertisings#approved"
    end
  end

  devise_for :users

  root to: "advertisings#index"
end
