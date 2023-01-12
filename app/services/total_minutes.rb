# frozen_string_literal: true
class TotalMinutes
  def initialize(arr)
    @arr = arr
  end

  def totalize
    total = 0
    @arr.each do |a|
      instance_minutes = MinutesLecture.new(a)
      total += instance_minutes.duration
    end
    total
  end
end
