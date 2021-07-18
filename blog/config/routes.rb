Rails.application.routes.draw do

  devise_for :users
  root  "users#index"
  #root "articles#index"
  
  resources :articles do
    resources :comments
  end
end
