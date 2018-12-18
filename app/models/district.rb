class District < ApplicationRecord
  belongs_to :city
  has_many :bus_stations, dependent: :destroy
end
