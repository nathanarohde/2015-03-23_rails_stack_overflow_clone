Rails.application.routes.draw do
  root :to => 'question#index'

  resources :questions do
    resources :answers, :except => [:show, :index]
  end
end
