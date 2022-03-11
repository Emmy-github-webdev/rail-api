Rails.application.routes.draw do
  root 'posts#index'
  get '/users/:user_id/posts', to: 'posts#postbyauser', as: 'post_by_user'
  resources :users do
    resources :posts do
      resources :comments
    end
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

end
