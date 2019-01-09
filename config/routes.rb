Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :static_pages, only: :index
    root "static_pages#index"
    resources :garages
    resources :customers
    resources :tickets
    namespace :admin do
      resources :garages
      resources :static_pages, only: %i(index)
    end
  end
end
