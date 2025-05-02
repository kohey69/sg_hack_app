Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  devise_for :administrators, controllers: {
    sessions: 'admins/sessions',
  }

  root 'home#index'

  namespace :admins do
    root 'food_sets#index'

    resources :food_sets, only: %i[show new create edit update destroy]
    resources :foods
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
