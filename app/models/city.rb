class City < ApplicationRecord
  has_many :districts, dependent: :destroy
  has_many :bus_stations, dependent: :destroy

  class << self
    def city_names
      City.all.map(&:name)
    end
  end
end
