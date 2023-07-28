Rails.application.routes.draw do
  get '/l/:slug', to: 'links#show', as: :short
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
