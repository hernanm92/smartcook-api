Rails.application.routes.draw do
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
