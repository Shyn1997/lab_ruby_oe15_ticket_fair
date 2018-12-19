class City < ApplicationRecord
  has_many :districts, dependent: :destroy
  has_many :bus_stations, dependent: :destroy

end
