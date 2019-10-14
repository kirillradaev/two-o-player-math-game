class Player

  attr_accessor :name, :lives

  def initialize(name, lives)
    @name = name
    @lives = lives
  end

  def info
    "Player's name is #{name}"
  end

end

# player = Player.new('Mike')
# puts player.info