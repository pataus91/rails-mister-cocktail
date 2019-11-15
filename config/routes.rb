Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "cocktails#index"
  resources :cocktails, only: [:new, :create, :index, :show] do
    resources :doses, only: [:new, :create] # => qui sto creando la dose relativa al cocktail specifico, devo dire a quale cocktail voglio mettere la dose
  end
  resources :doses, only: [:destroy] # => qui so a quale cocktail appartiene, quindi non serve nesting
end
