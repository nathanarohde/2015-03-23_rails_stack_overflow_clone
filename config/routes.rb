Rails.application.routes.draw do
  root :to => 'questions#index'

  resources :users, :except => [:destroy, :edit, :update]
  resources :questions do
    resources :answers, :except => [:show, :index]
      member do
        post 'upvote'
      end
  end

  get '/log-in' => 'sessions#new'
  post '/log-in' => 'sessions#create'
  get '/log-out' => 'sessions#destroy'

end
