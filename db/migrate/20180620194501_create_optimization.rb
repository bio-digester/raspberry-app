class CreateOptimization < ActiveRecord::Migration[5.1]
  def change
    create_table :optimizations do |t|
      t.string :temperature
      t.string :internal_pressure
      t.string :ph
      t.string :volume
      t.string :prediction
    end
  end
end
