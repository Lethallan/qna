Rails.application.routes.draw do
  get 'links/destroy'
  get 'files/destroy'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  root to: 'questions#index'

  devise_for :users

  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
  end

  resources :questions do
    resources :answers, shallow: true, except: %i[index show] do
      patch :update_inline
    end
  end

  resources :files, only: :destroy
  resources :links, only: :destroy
end
