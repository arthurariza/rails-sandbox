Rails.application.routes.draw do
  get 'static_pages/home'

  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"

  resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token

  root 'articles#index'

  get '/pages', to: 'pages#index'

  resources :articles do
    resources :comments
  end

  get '/stimulus', to: 'stimulus#index'
end
