Rails.application.routes.draw do
  resources :events
  resources :meetings
  resources :notes
  authenticated :user do
    root 'teams#home_team', as: :authenticated_root
  end
  root 'pages#home'
  resources :teams
  devise_for :users, path: '', path_names: {
    sign_up: 'register',
    sign_in: 'login',
    sign_out: 'logout'
  }, controllers: {
    invitations: 'invitations'}

  get '/show_teams', to: 'teams#show_teams'
  get '/attend', to: 'meetings#attend'
  get '/show_attendance', to: 'meetings#show_attendance'
end
