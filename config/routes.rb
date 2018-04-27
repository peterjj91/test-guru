Rails.application.routes.draw do

  resources :tests do
    resources :questions, shallow: true
  end

  get '/tests/:category/:title', to: 'tests#search'

end
