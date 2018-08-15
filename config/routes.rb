Rails.application.routes.draw do
  devise_for :artists, controllers: { omniauth_callbacks: 'artists/omniauth_callbacks' }
  resources :artists, only: [:index, :show] do
    # nested resource
    resources :shows, only: [:show, :index, :new, :create, :edit, :update]
  end

    resources :shows
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'application#hello'
end
