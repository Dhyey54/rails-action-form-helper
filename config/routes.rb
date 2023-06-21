Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'

  resources :users do
    collection do
    # Sign Up Routes
    post 'sign_up', to: 'registrations#create'
    get 'sign_up', to: 'registrations#new'

    # Login Routes
    post 'login', to: 'sessions#create', as: 'login'
    delete 'logout', to: 'sessions#destroy'
    get 'login', to: 'sessions#new'
    end
  end
end
