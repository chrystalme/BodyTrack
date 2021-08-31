Rails.application.routes.draw do
  resources :measure do
    resources :measurements
  end
end
