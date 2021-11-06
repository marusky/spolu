Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, path: '', path_names: {sign_up: 'register', sign_in: 'login', sign_out: 'logout'}
end
