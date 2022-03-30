Rails.application.routes.draw do
  root 'facilities#index'

  resources :facilities
  resources :focus_groups, only: :show

  # Lookbook for component UI in development
  mount Lookbook::Engine, at: '/lookbook' if Rails.env.development?
end
