namespace :sync do
  desc "Migrate the database through scripts in db/migrate and update db/schema.rb by invoking db:schema:dump. Target specific version with VERSION=x. Turn off output with VERBOSE=false."
  task :send_data => :environment do
    puts "===" * 200
    payload = {
      "water_flow": DataCollect.where(sensor_id: Sensor.find_by(name: "LEVEL").id).last.value,
      "temperature": DataCollect.where(sensor_id: Sensor.find_by(name: "TEMPDS").id).last.value,
      "internal_pressure": DataCollect.where(sensor_id: Sensor.find_by(name: "PRESSURE").id).last.value,
      "ph": DataCollect.where(sensor_id: Sensor.find_by(name: "PH").id).last.value,
      "volume": DataCollect.where(sensor_id: Sensor.find_by(name: "LEVEL").id).last.value,
      "gas_production": DataCollect.where(sensor_id: Sensor.find_by(name: "CONCENTRATION").id).last.value
    }
    begin
      response = RestClient.post("http://localhost:8999/api/biodigesters/", payload.to_json, content_type: :json)
      puts response
    rescue  RestClient::ExceptionWithResponse => e
      puts e.response
    end
  end

  task :retrieve_data => :environment do
  end
end
