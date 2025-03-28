Rails.application.routes.draw do
  resources :groceries, only: [:index, :update] do
    member do
      patch :mark_complete
    end
  end
  devise_for :users
  root to: "pages#home"

  get "calendar", to: "calendar#index"
  post "menus_from_calendar", to: "menus#create_from_calendar"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :recipes, except: :update do
    resources :menus, only: :create

  end

end
