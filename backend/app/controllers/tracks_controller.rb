class TracksController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def create
    @track = Track.create(track_params)

    render json: {
      ads: @track.device.rotations.last.ad.url,
      distance: @track.device.distance,
      profit: "$#{@track.device.balance}"
    }
  end

  private

  def track_params
    params.fetch(:track, {}).permit(:device_id, :latitude, :longitude)
  end
end
