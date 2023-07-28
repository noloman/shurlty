Rails.application.routes.draw do
  get 'home/index'
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
  root to: 'home#index'
end
