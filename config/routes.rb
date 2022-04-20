Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/users', to: 'users#show'
      #resources :users, only: [:show]
      resources :jobs, only: [:index, :create]
      
      get '/jobs/:id/houses', to: 'job_houses#index'
    end
  end
end
