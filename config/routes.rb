Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  scope '(:locale)', locale: /en|fr/ do
    root to: 'pages#home'
    get "skills", to: 'pages#skills'
    get "philosophy", to: 'pages#philosophy'
    get "projects", to: "pages#projects"
    get "projects/cosmonaut", to: "pages#cosmonaut"
    get "resources", to: "pages#resources"
    get "contact", to: "pages#contact"
  end
end
