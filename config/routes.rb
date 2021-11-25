Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :currencies, only: [:index, :show] do
    collection do
      post :load
      post :update_rates
    end
  end
end
