Rails.application.routes.draw do
  resources :employees

  root 'dashboard#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  get '/search', to: 'dashboard#searcher'

  get '/analysis/employee/:employee_name', to: 'employees#analysis', as: "analysis_employee"
  get '/schedule_of_activities', to: 'schedule_of_activities#index'
end
