Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  devise_for :users

  resources :questions do
    resources :answers, shallow: true, except: :index
  end

  root to: 'questions#index'
end
