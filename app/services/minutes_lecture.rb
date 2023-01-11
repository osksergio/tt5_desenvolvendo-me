# frozen_string_literal: true
class MinutesLecture
  def initialize(str)
    @str = str
  end

  def duration
    if @str.match?('min')

    else
      0
    end
  end
end