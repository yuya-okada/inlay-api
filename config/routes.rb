Rails.application.routes.draw do
  resources :projects
  resource :user
  mount_devise_token_auth_for 'User', at: 'auth'
end
