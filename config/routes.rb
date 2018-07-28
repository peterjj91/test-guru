 Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, controllers: { sessions_path: 'sessions' },
             path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  
  resources :badges, only: :index

  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  get 'feedback/new'
  post 'feedback/sendmessage'

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end

    resources :badges

    resources :gists, only: :index
  end

end
 