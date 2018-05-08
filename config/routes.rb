Rails.application.routes.draw do
  get '/questions/:id/del', to: 'questions#destroy'
  
  resources :tests do
    resources :questions, shallow: true
  end

  get '/tests/:category/:title', to: 'tests#search'

end
