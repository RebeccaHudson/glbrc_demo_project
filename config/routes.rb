Rails.application.routes.draw do
  get 'user_apps/add'

  get 'user_apps/remove'

  get 'user_apps/reorder'


  get '/home', to: 'homepage#show_home'
  get 'homepage/show_home'

  get 'sessions/new'

  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello_world_action'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'



end
