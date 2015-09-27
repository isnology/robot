# model of MVC

class ProcessCommand

  def initialize
    @robot_cmds = {MOVE: nil, LEFT: nil, RIGHT: nil, REPORT: nil, PLACE: nil}
    @table_cmds = {PLACE_OBJECT: nil, MAP: nil}
  end

  def execute_command(command, robot, table)
    if @robot_cmds.has_key?(command[0].upcase.to_sym)
      robot.__send__(command[0].downcase, command, table)
    elsif @table_cmds.has_key?(command[0].upcase.to_sym)
      table.__send__(command[0].downcase, command, robot)
    end
  end

end