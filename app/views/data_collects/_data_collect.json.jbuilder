json.extract! data_collect, :id, :data_measure, :value, :sensor_id, :created_at, :updated_at
json.url data_collect_url(data_collect, format: :json)
