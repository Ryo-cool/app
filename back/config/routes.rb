Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'posts/index'
      get 'posts/create'
    end
  end
  resources :users
  
  namespace :api do
    namespace :v1 do
      # api test action
      resources :hello, only:[:index]
      resources :posts
    end
  end
end
