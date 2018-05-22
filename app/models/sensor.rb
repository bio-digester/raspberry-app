class Sensor < ApplicationRecord
  has_many :data_collect
  validates_presence_of :name
  validates_presence_of :codename

end
