Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/users', to: 'users#show'
      get '/users/houses', to: 'user_houses#index'
      #resources :users, only: [:show]
      delete 'user/jobs/:job_id', to: 'user_jobs#destroy'
      post '/jobs/houses', to: 'job_houses#create'
      delete '/jobs/houses', to: 'job_houses#destroy'

      get '/jobs/:id/houses', to: 'job_houses#index'
      get '/jobs/houses', to: 'job_houses#show'
      get '/houses', to: 'houses#index'
      post '/houses', to: 'user_houses#create'
      get '/houses/jobs', to: 'house_jobs#index'
      resources :jobs, only: [:index, :show, :create]
    end
  end
end
