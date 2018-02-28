class Game

  attr_accessor(:current_player, :num1, :num2, :game_over)

  def initialize
    @num1 = 0
    @num2 = 0
    @current_player = "player 1"
    @game_over = false
  end

  protected
  def generate_number
    generator = Random.new
    self.num1 = generator.rand(1..20)
    self.num2 = generator.rand(1..20)
  end

  def generate_math_question
    math_question = "What does #{self.num1.to_s} plus #{self.num2.to_s} equal?"
  end

  def change_turn
    if self.current_player == "player 1"
      self.current_player = "player 2"
    else
      self.current_player == "player 1"
    end
  end

  def generate_question
    self.generate_number
    puts "#{self.current_player}: What does #{self.num1} plus #{self.num2} equal?"
  end

  def check_answer(p1, p2)
    answer = gets.chomp.to_i
    if answer == self.num1 + self.num2
      puts "Yes, you are correct!"
    else
      puts "Seriously? No!"
      p1.reduce_lives if self.current_player == "player 1"
      p2.reduce_lives if self.current_player == "player 2"
    end
    puts "#{p1.display_score} vs #{p2.display_score}"
    self.change_turn
  end

  def check_game_over(p1, p2)
    if p1.available_lives == 0
      puts "------------------------"
      puts "Player 2 wins with a score of #{p2.scores}"
      puts "--------Game Over--------"
      puts "GoodBye!"
      self.game_over = true
    elsif p2.available_lives == 0
      puts "------------------------"
      puts "Player 1 wins with a score of #{p1.scores}"
      puts "--------Game Over--------"
      puts "GoodBye!"
      self.game_over = true
    else
      puts "--------New Turn--------"
    end
  end

  public
  def start_game(p1, p2)
    while !self.game_over
      self.generate_question
      self.check_answer(p1, p2)
      p1.display_score
      p2.display_score
      self.check_game_over(p1,p2)
    end
  end


end