Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]

  resources :events, only: [:new, :create, :show]

    # Sessions
    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'

    root 'events#index'

    # Create invitations
    get '/events/:id/invitations/new', to: 'invitations#new', as: 'new_invitation'
    post '/events/:id/invitations/new', to: 'invitations#create'

end