Rails.application.routes.draw do
  resources :measure do
    resources :measurements
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
