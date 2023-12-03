module Output
  def self.title(day, str)
    "********* Day #{day}: #{str} *********"
  end

  def self.solution(part, answer)
    "Part #{part}: #{answer}"
  end
end