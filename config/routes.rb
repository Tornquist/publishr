Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  get '/users/:id', to: 'users#show', as: "user_profile"
  get '/', to: 'static#index', as: "home"
end
