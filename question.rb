class Question

  attr_accessor :correct

  def ask
    first = rand(1..20)
    second = rand(1..20)
    @correct = first + second
    puts "What does #{first} plus #{second} equal?"
    answer = $stdin.gets.chomp
  end

end