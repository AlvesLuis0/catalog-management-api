Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"

  defaults format: :json do
    devise_for :owners, path: "auth", path_names: { sign_in: "login", sign_out: "logout", registration: "signup" }
    resources :categories
    resources :products
    get "catalog/:owner_id", to: "catalog#show", as: :catalog
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.
    get "up" => "rails/health#show", as: :rails_health_check

    # Defines the root path route ("/")
    # root "posts#index"
  end
end
