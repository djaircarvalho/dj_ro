Rails.application.routes.draw do
  root 'default#index'

  resources :projects do
    resources :sprints do
        resources :tasks
    end
  end
  resources :teams
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
