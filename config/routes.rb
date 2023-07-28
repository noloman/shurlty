Rails.application.routes.draw do
  get '/l/:slug', to: 'links#show', as: :short
end
