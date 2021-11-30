Rails.application.routes.draw do
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
end
