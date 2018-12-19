class Trip < ApplicationRecord
  belongs_to :coach
  has_many :stop_points, dependent: :destroy
  has_many :tickets, dependent: :destroy

  self.skip_time_zone_conversion_for_attributes = [:time_start, :time_finish]

  scope :search_trip, (lambda do |city_start, city_end, date|
    joins("LEFT JOIN coaches ON trips.coach_id = coaches.id")
    .where("trips.city_start = '#{city_start}' and trips.city_finish =
      '#{city_end}' and trips.time_start between '#{date}'
      and '#{date} 23:59:59'")
  end)

  scope :search_trip_by_garage, (lambda do |gara|
    joins("LEFT JOIN garages ON coaches.garage_id = garages.id")
    .where("garages.id = #{gara}")
  end)
end
