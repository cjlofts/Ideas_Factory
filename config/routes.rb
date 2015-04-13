Rails.application.routes.draw do
  
  root "ideas#index"

  resources :ideas do
    resources :comments
  end

end
