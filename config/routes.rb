Rails.application.routes.draw do

  root to: 'users#new'

  scope module: 'user' do
    resources :jobs
  end

  resources :users,  only: [:index, :new, :show, :create]

  namespace :admin do
    resources :stats, :users, :jobs
  end
  # resources :jobs

  get '/admin', to: 'admin#show'
  get '/admin/login', to: "sessions#new"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get '/slack', to: 'slack#handle'
  get '/auth/:provider/callback', to: 'sessions#create'
  
  namespace :slack do
    resources :jobs, only: [:create]
  end
  
  # post '/slack', to: 'slack#create'
  # post '/slack_buttons', to: 'slack#buttons'
end
  