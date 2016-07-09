Rails.application.routes.draw do
  devise_for :users

  root 'subcheckits#index'

  resources :users do
    resources :messages
  end

  resources :subcheckits do
    resources :messages do
      resources :comments
      post :vote
      get  :score
    end
  end

end
