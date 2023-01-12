# frozen_string_literal: true
class SetTracks
  def initialize(minutes)
    @minutes = minutes
    @minutes_track = 360
    @qtd_tracks = 0
  end

  def create_tracks
    @qtd_tracks = (@minutes / @minutes_track).truncate() unless @minutes.zero?
    if @qtd_tracks > 0
      for i in 1..(@qtd_tracks)

      end
      return true
    else
      return false
    end
  end
end
