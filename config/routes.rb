Rails.application.routes.draw do
  root "static_pages#home"

  resources :houses, only: %i[index show]

  namespace :admin do
    resources :houses, module: "houses" do
      resources :vehicles
      resources :residents do
        patch :add_person, on: :member
      end
      resources :pets, except: :show
    end
    resources :people
  end
end
