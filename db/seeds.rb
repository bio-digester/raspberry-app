DataCollect.destroy_all
Sensor.destroy_all
puts "Criando Sensores e DataCollects"

Sensor.create([{ name: "TEMPDS" }, { name: "PRESSURE" },
  {name: "PH"}, { name: "CONCENTRATION" }, { name: "LEVEL" }, { name: "ENTRY" }])

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
