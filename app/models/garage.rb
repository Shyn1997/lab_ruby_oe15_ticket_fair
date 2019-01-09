class Garage < ApplicationRecord
  has_many :coaches, dependent: :destroy
  has_many :users, dependent: :destroy

  scope :search_garage, (lambda do |city_start, city_end, date|
    joins("LEFT JOIN coaches ON garages.id = coaches.garage_id
      LEFT JOIN trips ON coaches.id = trips.coach_id")
    .where("trips.city_start LIKE ?", "%#{city_start}%")
    .where("trips.city_finish LIKE ?", "%#{city_end}%")
    .where("trips.time_start between ? and ?", "#{date.to_s} 00:00:00",
      "#{date.end_of_day}")
    .group("garages.id")
  end)
end
