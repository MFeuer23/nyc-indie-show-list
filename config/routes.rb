Rails.application.routes.draw do
    get '/shows/tonight' => 'shows#tonight'

  devise_for :artists, controllers: { omniauth_callbacks: 'artists/omniauth_callbacks', registrations: 'registrations' }
  resources :artists, only: [:index, :show, :edit, :update] do
    # nested resource
    resources :shows, only: [:show, :index, :new, :create, :edit, :update]
  end
    resources :venues
    resources :shows
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'application#hello'
    post '/artists/search' => 'artists#search'

end
