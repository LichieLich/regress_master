Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "duties#index"

  resources :users, only: %i[index new create destroy edit update] do
  end
end
