Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/auth/login', to: 'authentication#login'
  post '/auth/signup', to: 'authentication#signup'
  post '/goal', to: 'goals#create_goal'
  put 'goal/:id', to: 'goals#update_goal'
  get 'goals' , to: 'goals#goals'
end
