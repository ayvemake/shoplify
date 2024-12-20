Rails.application.routes.draw do
  root "products#index"
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "checkout/create", to: "checkout#create"

  get "up" => "rails/health#show", as: :rails_health_check
end
