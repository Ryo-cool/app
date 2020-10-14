Rails.application.routes.draw do
  resources :users
  
  namespace :api do
    namespace :v1 do
      resources :spots do
      end
      resources :reviews
    end
  end
end
