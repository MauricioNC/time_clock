Rails.application.routes.draw do
  resources :employees
  resources :departments, only: [:new, :create, :update, :destroy]

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

  get '/checkin', to: 'employee_schedules#new'
  post '/checkin', to: 'employee_schedules#create'

  post '/absence', to: 'absences#create'
end
