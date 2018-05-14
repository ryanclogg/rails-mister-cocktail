Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'cocktails#index'
  #COCKTAILS
  get 'cocktails', to: 'cocktails#index', as: 'cocktails'
  get 'cocktails/:id', to: 'cocktails#show', as: 'cocktail'

  get 'cocktails/new', to: 'cocktails#new', as: 'new_cocktail'
  post 'cocktails', to: 'cocktails#create'

  #DOSES
  resources :cocktails do
    resources :doses, only: [ :new, :create, :destroy ]
  end

end
