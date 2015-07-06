# view of MVC
class Input

  attr_reader :command

  def initialize
    @command = []
  end

  def enter_command
    puts "\nEnter a command:"
    @command = gets.chomp.split(/[ ,]/)
  end

  def quit?
    @command[0].upcase == 'QUIT'
  end
end
