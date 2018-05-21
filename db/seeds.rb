DataCollect.destroy_all
Sensor.destroy_all
puts "Criando Sensores e DataCollects"

Sensor.create!([{ name: "TEMPDS", codename: "Temperatura" },
  { name: "CONCENTRATION", codename: "Gás Metano" }, { name: "PRESSURE" , codename: "Pressão" },
  { name: "LEVEL" , codename: "Nível" }, { name: "water_flux", codename: "Fluxo de Água" },
  {name: "PH" , codename: "pH"}])

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
