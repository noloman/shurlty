Rails.application.routes.draw do
  get 'home/index'
  get  '/l/:slug', to: 'links#show', as: :short
  post '/shortify', to: 'links#create', as: :new_link
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
  root to: 'home#index'
  get '/privacy_policy', to: redirect('/privacy_policy.html'), as: :privacy_policy
  resources :links
  resources :contact_form, only: %i[new create]
end
