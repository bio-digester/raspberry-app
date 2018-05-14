DataCollect.destroy_all
Sensor.destroy_all
puts "Criando Sensores e DataCollects"

Sensor.create!([{ name: "temperature", codenome: "Temperatura" },
  { name: "methane_gas", codenome: "Gás Metano" }, { name: "pressure" , codenome: "Pressão" },
  { name: "level" , codenome: "Nível" }, { name: "water_flux", codenome: "Fluxo de Água" },
  {name: "ph" , codenome: "pH"}])

Sensor.all.each do |f|
  50.times do
    begin
      DataCollect.create!({
        value: Faker::Number.between(0.01, 1.5),
        data_measure: Faker::Time.between(DateTime.now - 20, DateTime.now),
        sensor_id: f.id
        })
      end
    end
end
