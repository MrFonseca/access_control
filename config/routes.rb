Rails.application.routes.draw do
  root "static_pages#home"

  resources :houses, only: %i[index show]

  namespace :admin do
    resources :houses do
      resources :residents
    end
    resources :people
  end
end
