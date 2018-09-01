Rails.application.routes.draw do
  devise_for :artists, controllers: { omniauth_callbacks: 'artists/omniauth_callbacks' }
  resources :artists, only: [:index, :show, :edit, :update, :delete] do
    # nested resource
    resources :shows, only: [:show, :index, :new, :create, :edit, :update, :delete]
  end
    resources :venues, only: [:show, :index, :edit, :update, :delete]
    resources :shows
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'application#hello'
    post '/artists/search' => 'artists#search'
end
