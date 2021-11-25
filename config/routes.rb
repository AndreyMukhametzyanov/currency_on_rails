Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/currencies', to: 'currencies#index'
  get '/currencies/:CharCode', to: 'currencies#show'
  post '/currencies', to: 'currencies#load_currencies'
  post '/currencies/update_rates', to: 'currencies#update_rates'
end
