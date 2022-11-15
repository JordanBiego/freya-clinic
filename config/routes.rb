Rails.application.routes.draw do
  resources :municipes, except: %i[destroy]

  root 'municipes#index'

end
