Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'articles#index'

  get '/pages', to: 'pages#index'

  resources :articles do
    resources :comments
  end
end
