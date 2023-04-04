Rails.application.routes.draw do
  # get 'site/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'site#index'

  post '/ask', to: 'site#ask'

  get 'question/:id', to: 'site#question', as: 'question'
  
  get '/not_found', to: 'site#not_found'

  match '*path', to: 'site#not_found', via: :all

end
