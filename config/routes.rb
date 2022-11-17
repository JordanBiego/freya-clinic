Rails.application.routes.draw do
  resources :municipes, except: %i[destroy] do
    get 'swap', to: 'municipes#change_status'

  end

  root 'municipes#index'

end
