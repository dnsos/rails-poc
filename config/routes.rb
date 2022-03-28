Rails.application.routes.draw do
  root 'facilities#index'

  resources :facilities
  resources :focus_groups, only: :show
end
