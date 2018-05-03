Rails.application.routes.draw do
  get 'user/:id', to: 'hello#user_items_reviews'
  get 'city/:id', to: 'hello#items_in_particular_city'
end 
