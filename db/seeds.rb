DataCollect.destroy_all
Sensor.destroy_all
puts "Criando Sensores e DataCollects"

Sensor.create!([{ name: "TEMPDS", codename: "Temperatura" },
  { name: "CONCENTRATION", codename: "Gás Metano" }, { name: "PRESSURE" , codename: "Pressão" },
  { name: "LEVEL" , codename: "Volume" }, { name: "PH" , codename: "pH"}])


Sensor.all.each do |f|
  Faker::Number.between(200, 700).times do
    begin
      DataCollect.create!({
        value: Faker::Number.between(0.01, 1.5),
        data_measure: DateTime.now + 40,
        sensor_id: f.id
        })
      end
    end
end
