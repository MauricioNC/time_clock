Rails.application.routes.draw do
  resources :employees

  root 'dashboard#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  get '/search', to: 'dashboard#searcher'

  get '/home', to: 'dashboard#home'
  get '/analysis/employee/:employee_name', to: 'employees#analysis', as: "analysis_employee"
  get '/statistics', to: 'employees#statistics'
  get '/account', to: 'employees#account'
  get '/settings', to: 'employees#settings'

  get '/schedule_of_activities', to: 'schedule_of_activities#index'
end
