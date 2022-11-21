Rails.application.routes.draw do
  resources :municipes, except: %i[show destroy] do
    get 'swap', to: 'municipes#change_status'

  end

  root 'municipes#index'

end
