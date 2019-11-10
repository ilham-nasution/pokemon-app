Rails.application.routes.draw do
  root to: 'pokemons#index'
  get "pokemons/grass", to: "pokemons#index_grass", as: :grass_pokemons
  get "pokemons/water", to: "pokemons#index_water", as: :water_pokemons
  get "pokemons/fire", to: "pokemons#index_fire", as: :fire_pokemons
  resources :pokemons do
    resources :moves, only: [:new, :create]
  end
  resources :moves, only: [:destroy]
end
