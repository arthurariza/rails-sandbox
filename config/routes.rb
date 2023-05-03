Rails.application.routes.draw do
  get 'static_pages/home'

  get "sign_up", to: "users#new"
  post "sign_up", to: "users#create"

  resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token

  root 'articles#index'

  get '/pages', to: 'pages#index'

  resources :articles do
    resources :comments
  end

  get '/stimulus', to: 'stimulus#index'
end
