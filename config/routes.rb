Rails.application.routes.draw do
  resources :teams
  devise_for :users, path: '', path_names: {
    sign_up: 'register',
    sign_in: 'login',
    sign_out: 'logout'
  }, controllers: {
    invitations: 'invitations'}
  authenticated :user do
    root to: 'teams#index', as: :authenticated_root
  end
  root 'pages#home'
end
