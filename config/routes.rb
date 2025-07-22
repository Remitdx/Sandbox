Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ('/')
  scope "(:locale)", locale: /en|fr/ do
    match "/404", via: :all, to: "errors#not_found"
    match "/422", via: :all, to: "errors#unprocessable_entity"
    match "/500", via: :all, to: "errors#internal_server_error"
    root to: "pages#home"
    get "admin", to: "pages#admin"
    get "cv", to: "pages#cv"
    get "philosophy", to: "pages#philosophy"
    get "projects", to: "pages#projects"
    get "uikit", to: "pages#uikit"
    get "legal", to: "pages#legal"

    resources :contacts, only: [ :index, :new, :create, :update, :destroy ]

    namespace :games do
      resources :dikkeneks, only: [ :index, :create, :show, :update ]
      resources :puzzles, only: [ :index, :create, :show, :update ]
      resources :escapes, only: [ :create, :show, :update ]
      resources :morbacs, only: [ :create, :update, :show ], path: "tictactoe"
      resources :puissance4s, only: [ :create, :update, :show ]
    end

    namespace :utilities do
      resources :tournaments, only: [ :index, :create, :show, :update ]
      resources :rolls, only: [ :create, :show, :update ] do
        resources :roll_dices, only: [ :new, :create, :edit, :update ]
      end
      resources :roll_dices, only: [ :destroy ]
    end
  end
end
