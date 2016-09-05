Rails.application.routes.draw do
  put '/recipes_per_users', to: 'recipes_per_users#update'
  delete '/recipes_per_users', to: 'recipes_per_users#destroy'

  put '/ingredients_per_recipes', to: 'ingredients_per_recipes#update'
  delete '/ingredients_per_recipes', to: 'ingredients_per_recipes#destroy'

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
