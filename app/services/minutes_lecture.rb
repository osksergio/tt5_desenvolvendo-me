# frozen_string_literal: true

# recuperar a quantidade de minutos da palestra
class MinutesLecture
  def initialize(str)
    @str = str
  end

  def duration
    if @str.match?('min')
      @str.split(' ').last.scan(/\d+/)&.join().to_i
    else
      0
    end
  end
end
