Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get 'portfolio-details/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
