Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  delete '/', to: 'sessions#destroy'

  get 'auth/google_oauth2/callback', to: 'users#index'

  namespace :search do
    get '/books', to: 'books#index'
  end

  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'

  get '/dashboard', to: 'users#show'
end
