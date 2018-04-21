Rails.application.routes.draw do
  resources :sensors do
    resources :data_collects
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
