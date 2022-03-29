Rails.application.routes.draw do
  root 'facilities#index'

  devise_for :users

  resources :facilities
  resources :focus_groups, only: :show
end
