class CreateDataCollects < ActiveRecord::Migration[5.1]
  def change
    create_table :data_collects do |t|
      t.datetime :data_measure
      t.string :value
      t.references :sensor, foreign_key: true

      t.timestamps
    end
  end
end
