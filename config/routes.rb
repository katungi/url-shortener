Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/o/:slug', to: 'links#show', as: :short

  get 'new', to: 'links#new'

  resources :links

end
