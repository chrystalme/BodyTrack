Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :measure
      resources :measurement, only: %i[index create]
    end
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'user_info', to: 'users#user_info'
end
