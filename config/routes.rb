Rails.application.routes.draw do

  devise_for :users
  root "ideas#index"

  resources :ideas do
    resources :comments
    resources :joins
    resources :likes
  end

  resources :likes, only: [:index, :show]
end
