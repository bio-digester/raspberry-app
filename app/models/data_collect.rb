class DataCollect < ApplicationRecord
  belongs_to :sensor
  validates_presence_of :data_measure, :value

end
