# frozen_string_literal: true
class SetTracks
  def initialize(minutes)
    @minutes = minutes
    @minutes_track = 360
    @qtd_tracks = 0
  end

  def create_tracks
    @qtd_tracks = (@minutes / @minutes_track) unless @minutes.zero?
    # definir se vai truncar (truncate) ou arredondar (ceil)

    # inserir as tracks
    #
  end
end
