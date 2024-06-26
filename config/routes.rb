# config/routes.rb
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show, :index]
      post '/login', to: 'sessions#create'
    end
  end
end