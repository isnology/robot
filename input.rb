class Input

  def initialize
  end

  def command
    puts "Enter a command:"
    @command = gets.chomp.upcase.split(/[ ,]/)
  end

  def quit?
    @command[0] == 'QUIT'
  end

  def execute_command(robot, table)
    case @command[0]
      when 'MOVE'
        robot.move(table)
      when 'LEFT'
        robot.left
      when 'RIGHT'
        robot.right
      when 'REPORT'
        robot.report
      when 'PLACE'
        robot.place(@command[1].to_i, @command[2].to_i, @command[3], table)
    end
  end
end
