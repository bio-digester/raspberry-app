Rails.application.routes.draw do

  root to: "dashboards#index"


  resources :sensors do
    resources :data_collects
  end

  get 'temperature' => 'dashboards#get_temperature' , as: 'get_temperature'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
