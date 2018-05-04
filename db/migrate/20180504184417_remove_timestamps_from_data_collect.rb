class RemoveTimestampsFromDataCollect < ActiveRecord::Migration[5.1]
  def change
    remove_column :data_collects, :created_at, :string
    remove_column :data_collects, :updated_at, :string
  end
end
