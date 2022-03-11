Rails.application.routes.draw do
  # root "articles#index"
  resources :posts

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
