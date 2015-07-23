Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'static#index'
end
