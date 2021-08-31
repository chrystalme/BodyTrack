Rails.application.routes.draw do
  resources :measures do
    resources :measurements
  end
end
