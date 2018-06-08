Rails.application.routes.draw do

  root to: "dashboards#index"

  get '/api/sensors' => 'sensors#api_index'
  post '/api/sensors' => 'sensors#api_create'
  get '/api/sensors/new' => 'sensors#api_new'
  get '/api/sensors/edit' => 'sensors#api_edit'
  get '/api/sensors/:id' => 'sensors#api_show'
  patch '/api/sensors/:id' => 'sensors#api_update'
  put '/api/sensors/:id' => 'sensors#api_update'
  delete '/api/sensors/:id' => 'sensors#api_destroy'

  get '/api/sensors/:sensor_id/data_collects' => 'data_collects#api_index'
  post '/api/sensors/:sensor_id/data_collects' => 'data_collects#api_create'
  get '/api/sensors/:sensor_id/data_collects/new' => 'data_collects#api_new'
  get '/api/sensors/:sensor_id/data_collects/:id/edit' => 'data_collects#api_edit'
  get '/api/sensors/:sensor_id/data_collects/:id/' => 'data_collects#api_show'
  patch '/api/sensors/:sensor_id/data_collects/:id/' => 'data_collects#api_update'
  put '/api/sensors/:sensor_id/data_collects/:id/' => 'data_collects#api_update'
  delete '/api/sensors/:sensor_id/data_collects/:id/' => 'data_collects#api_destroy'


  get '/sensors' => 'sensors#index', as: 'sensors'
  get '/sensors/:id' => 'sensors#show' , as: 'sensor'

  get '/sensors/:sensor_id/data_collects/:id' => 'data_collects#show', as: 'sensor_data_collect'
  get '/sensors/:sensor_id/data_collects' => 'data_collects#index', as: 'sensor_data_collects'

  get '/temperature' => 'dashboards#get_temperature' , as: 'get_temperature'

  get '/send_data' => 'sync#send_data', as: 'send_data'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
