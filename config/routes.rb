Rails.application.routes.draw do
  devise_for :users

  root 'subcheckits#index'

  resources :users do
    resources :posts
  end

  resources :subcheckits do
    resources :posts do
      resources :comments
      post :vote
      get  :score
    end
  end

end
