# frozen_string_literal: true
class SetTracks
  def initialize(minutes)
    @minutes = minutes
    @minutes_track = 360
    @qtd_tracks = 0
  end

  def create_tracks(conf_id)
    @qtd_tracks = (@minutes / @minutes_track).truncate() unless @minutes.zero?

    if @qtd_tracks > 0
      @qtd_tracks.times do |index|
        Track.create(description: "Track #{index}", conference_id: conf_id)
      end

      return true
    else
      return false
    end
  end
end
