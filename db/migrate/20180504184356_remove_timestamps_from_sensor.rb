class RemoveTimestampsFromSensor < ActiveRecord::Migration[5.1]
  def change
    remove_column :sensors, :created_at, :string
    remove_column :sensors, :updated_at, :string
  end
end
