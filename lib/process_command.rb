# model of MVC

class ProcessCommand

  def execute_command(command, robot, table)
    case command[0].upcase
      when 'MOVE'
        robot.move(table)
      when 'LEFT'
        robot.left
      when 'RIGHT'
        robot.right
      when 'REPORT'
        robot.report
      when 'PLACE'
        robot.place(command[1].to_i, command[2].to_i, command[3].upcase, table)
      when 'PLACE_OBJECT'
        x, y = robot.next_move
        table.add_obstacle(x, y)
      when 'MAP'
        table.map
    end
  end

end