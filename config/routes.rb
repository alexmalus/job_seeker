# frozen_string_literal: true

require 'sidekiq/web'

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'home/index'
  mount Sidekiq::Web => '/sidekiq' # mount Sidekiq::Web in your Rails app

  # Framework restriction; REQUEST_METHOD type for lazy loading MUST be GET.
  get '/jobs/initial_load', to: 'jobs/refresh#initial_load', as: 'jobs_initial_load'
  post '/jobs/refresh', to: 'jobs/refresh#perform', as: 'jobs_refresh'

  get '/service-worker.js' => 'service_worker#service_worker'
  get '/manifest.json' => 'service_worker#manifest'

  root 'jobs#index'
end
