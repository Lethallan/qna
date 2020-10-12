Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  devise_for :users

  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
  end

  resources :questions do
    resources :answers, shallow: true, except: :index
  end

  root to: 'questions#index'
end
