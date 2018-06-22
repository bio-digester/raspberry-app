namespace :sync do
  desc "Send data to server"
  task :send_data => :environment do
    puts "====================================================Send data===================================================="
    payload = [{
      "water_flow": DataCollect.where(sensor_id: Sensor.find_by(name: "LEVEL").id).last.value,
      "temperature": DataCollect.where(sensor_id: Sensor.find_by(name: "TEMPDS").id).last.value,
      "internal_pressure": DataCollect.where(sensor_id: Sensor.find_by(name: "PRESSURE").id).last.value,
      "ph": DataCollect.where(sensor_id: Sensor.find_by(name: "PH").id).last.value,
      "volume": DataCollect.where(sensor_id: Sensor.find_by(name: "LEVEL").id).last.value,
      "gas_production": DataCollect.where(sensor_id: Sensor.find_by(name: "CONCENTRATION").id).last.value
    }]
    begin
      response = RestClient.post("https://datadigester.centeias.net/api/samples/", payload.to_json, content_type: :json)
      puts response
    rescue  RestClient::ExceptionWithResponse => e
      puts e.response
    end
  end

  desc "Retrieve data to server"
  task :retrieve_data => :environment do
    puts "====================================================Retrieve data===================================================="
    begin
      response = RestClient.get("https://datadigester.centeias.net/api/optimize/")
      response = JSON.parse(response)
      response.each do |r|
        puts "Cadastrando Optimization"
        puts r
        Optimization.create(r)
      end
    rescue  RestClient::ExceptionWithResponse => e
      puts e.response
    end
  end

  desc "Syncronize data"
  task :synchronize_data => :environment do
    puts "====================================================Syncronize data===================================================="
    payload = [{
      "water_flow": DataCollect.where(sensor_id: Sensor.find_by(name: "LEVEL").id).last.value,
      "temperature": DataCollect.where(sensor_id: Sensor.find_by(name: "TEMPDS").id).last.value,
      "internal_pressure": DataCollect.where(sensor_id: Sensor.find_by(name: "PRESSURE").id).last.value,
      "ph": DataCollect.where(sensor_id: Sensor.find_by(name: "PH").id).last.value,
      "volume": DataCollect.where(sensor_id: Sensor.find_by(name: "LEVEL").id).last.value,
      "gas_production": DataCollect.where(sensor_id: Sensor.find_by(name: "CONCENTRATION").id).last.value
    }]
    begin
      puts "====================================================Send data===================================================="
      response = RestClient.post("https://datadigester.centeias.net/api/samples/", payload.to_json, content_type: :json)
      puts response
      puts "====================================================Retrieve data===================================================="
      response = RestClient.get("https://datadigester.centeias.net/api/optimize/")
      response = JSON.parse(response)
      response.each do |r|
        puts "Cadastrando Optimization"
        puts r
        Optimization.create(r)
      end
    rescue  RestClient::ExceptionWithResponse => e
      puts e.response
    end
  end

end
