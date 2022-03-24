Rails.application.routes.draw do
  root 'facilities#index'

  resources :facilities
end
