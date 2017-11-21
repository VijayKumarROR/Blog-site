Rails.application.routes.draw do
  devise_for :users
  resources :posts
  #resources :post
  #get '/posts/search' => 'posts/search'
  match 'posts/search', to: 'posts#search', via: 'post'



  devise_scope :user do
    authenticated :user do
    root :to => 'posts#index', as: :authenticated_root
  end
  unauthenticated :user do
    root :to => 'devise/registrations#new', as: :unauthenticated_root
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
