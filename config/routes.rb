Rails.application.routes.draw do
  root to: 'dashboard#index'
  get '/dashboard/*other' => 'dashboard#index'

  get '/login' => 'sessions#login'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  scope '/api' do
    scope '/v1' do
      resources :photos, controller: 'photos'
      post '/photos/:photo_id/:action/:value' => 'photos#:action'
    end
  end

end
