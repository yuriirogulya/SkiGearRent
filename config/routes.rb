Rails.application.routes.draw do
  resources :users do
    resources :user_reviews, controller: 'user_reviews'
  end
  resources :items do
    resources :item_reviews, controller: 'item_reviews'
  end
  resources :cities
  resources :bookings 
  get '/cities/task/:id', to: 'cities#all_items_in_particular_city'
  get '/items/task/:id', to: 'items#all_user_items_reviews'
end 
