Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ('/')
  scope "(:locale)", locale: /en|fr/ do
    root to: "pages#home"
    get "cv", to: "pages#cv"
    get "philosophy", to: "pages#philosophy"
    get "projects", to: "pages#projects"
    get "contact", to: "pages#contact"
    get "uikit", to: "pages#uikit"
    get "featureflags", to: "pages#featureflags"
    get "search", to: "application#search"

    namespace :games do
      namespace :risk_games do
        resources :risks, only: [ :create, :edit, :update, :show ]
        resources :players, only: [ :create, :destroy ]
        resources :maps, only: [ :create ]
        resources :tiles, only: [ :show ]
      end

      resources :rolls, only: [ :create, :show, :update ] do
        resources :roll_dices, only: [ :new, :create, :edit, :update ]
      end
      resources :roll_dices, only: [ :destroy ]

      resources :morbacs, only: [ :create, :update, :show ], path: "tictactoe"
      resources :puissance4s, only: [ :create, :update, :show ]
      get "pong", to: "pong#play"
    end
  end
end
