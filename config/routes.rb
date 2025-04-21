Rails.application.routes.draw do
  post '/login', to: 'sessions#create'
  get '/me', to: 'users#show'
  get '/bookclub', to: 'users#index'
  get '/view_profile/:id', to: 'users#show'
  post '/signup', to: 'users#create'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'
  
  namespace :api do
    namespace :v1 do
      resources :books
      resources :meetings
      resources :recommendations
      resources :reports do
        member do
          patch :resolve #for this route enter: localhost:3000/api/v1/reports/:id/resolve
        end
      end
    end
  end
  
end

