Rails.application.routes.draw do
  put '/recipes_per_users', to: 'recipes_per_users#update'
  delete '/recipes_per_users', to: 'recipes_per_users#destroy'

  put '/ingredients_per_recipes', to: 'ingredients_per_recipes#update'
  delete '/ingredients_per_recipes', to: 'ingredients_per_recipes#destroy'

  put '/food_categories_per_users', to: 'food_categories_per_users#update'
  delete '/food_categories_per_users', to: 'food_categories_per_users#destroy'

  put '/ingredients_per_users', to: 'ingredients_per_users#update'
  delete '/ingredients_per_users', to: 'ingredients_per_users#destroy'

  put '/badges_per_users', to: 'badges_per_users#update'
  delete '/badges_per_users', to: 'badges_per_users#destroy'

  put '/frequent_users', to: 'frequent_users#update'
  delete '/frequent_users', to: 'frequent_users#destroy'

  resources :frequent_users, except: [:new, :edit]
  resources :badges_per_users, except: [:new, :edit]
  resources :ingredients_per_users, except: [:new, :edit]
  resources :food_categories_per_users, except: [:new, :edit]
  resources :sessions, only: [:create, :destroy]
  resources :recipes_per_users, except: [:new, :edit]
  resources :ingredients_per_recipes, except: [:new, :edit]
  resources :users, except: [:new, :edit]
  resources :ingredients, except: [:new, :edit]
  resources :recipes, except: [:new, :edit]
  resources :food_categories, except: [:new, :edit]
  resources :badges, except: [:new, :edit]

  get '/', to: 'application#index'
  get '*path', to: 'application#routing_error'
  delete '*path', to: 'application#routing_error'
  post '*path', to: 'application#routing_error'
  put '*path', to: 'application#routing_error'
  patch '*path', to: 'application#routing_error'
end
