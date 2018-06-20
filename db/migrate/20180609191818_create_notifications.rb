class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.string :message
      t.boolean :visualized, default: false
      t.datetime :message_date
    end
  end
end
