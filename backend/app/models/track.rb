class Track < ApplicationRecord
  belongs_to :device

  before_create :rotate
  before_create :add_distance

  private

  def rotate
    if device.tracks.empty? or device.tracks.last.created_at < 5.minutes.ago
      device.rotations.create ad: Ad.offset(rand(Ad.count)).first
    end
  end

  def add_distance
    if device.tracks.any?
      previous_track = device.tracks.last
      source = Geokit::LatLng.new(previous_track.latitude, previous_track.longitude)
      destination = Geokit::LatLng.new(latitude, longitude)
      distance = source.distance_to(destination)

      device.increment! :distance, distance
      device.increment! :balance, distance * device.rotations.last.ad.cpm
    end
  end
end
