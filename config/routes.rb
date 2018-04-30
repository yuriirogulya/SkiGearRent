Rails.application.routes.draw do
  get '/city', to: 'cities#index'
  get '/item', to: 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
