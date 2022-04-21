Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/users', to: 'users#show'
      #resources :users, only: [:show]
      delete '/user/:user_id/jobs/:job_id', to: 'user_jobs#destroy'
      post '/jobs/houses', to: 'job_houses#create'

      get '/jobs/:id/houses', to: 'job_houses#index'
      get '/jobs/houses', to: 'job_houses#show'
      resources :jobs, only: [:index, :show, :create]
    end
  end
end
