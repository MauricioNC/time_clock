Rails.application.routes.draw do
  resources :employee

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  get '/home', to: 'dashboard#home'
  get '/search', to: 'dashboard#searcher'

  get '/analysis/employee/:employee_name', to: 'employees#analysis', as: "analysis_employee"
end
