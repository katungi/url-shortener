Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/i/:slug', to: 'links#show', as: :short

  #get 'new', to: 'links#new'

  resources :links

  root to: "links#index"

end
