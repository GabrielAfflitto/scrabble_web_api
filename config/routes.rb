Rails.application.routes.draw do
  root "welcome#index"
  get '/search', to: 'search#index'

  namespace :api do
    namespace :v1 do
      resources :games, only: [:index, :show]do
        resources :plays, only: [:create]
      end
    end
  end
end
