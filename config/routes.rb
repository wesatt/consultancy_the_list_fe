Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  delete '/', to: 'sessions#destroy'

  get 'auth/google_oauth2/callback', to: 'users#index'

  resources :movies, only: %i[index show]

  namespace :search do
    get '/books', to: 'books#index'
    resources :movies, only: %i[index]
  end

  get '/dashboard', to: 'users#show'
end
