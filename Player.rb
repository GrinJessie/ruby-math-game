class Player

  attr_accessor(:name, :max_lives, :available_lives)

  def initialize(name)
    @name = name
    @max_lives = 3
    @available_lives = 3
  end

def scores
  "#{self.available_lives}/#{self.max_lives}"
end

def display_score
  "#{self.name}: #{self.scores}"
end

def reduce_lives
  self.available_lives -= 1
end


end
