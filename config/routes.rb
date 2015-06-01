Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get '/:locale' => 'home#index'
  
  root 'home#index'

  scope "(:locale)", locale: /en|pl/ do
    ActiveAdmin.routes(self)
    get 'search' => 'videos#index', as: :search
    resources :tutorials
    resources :entries
    resources :images
    resources :comments

    resources :videos do
      member do
        post :vote
        post :add_comment
        get :tags
      end
    end   
  end
end
