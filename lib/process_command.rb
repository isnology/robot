# model of MVC

class ProcessCommand

  def initialize(robot, table)
    @cmds = {MOVE: robot, LEFT: robot, RIGHT: robot, REPORT: robot, PLACE: robot, PLACE_OBJECT: table, MAP: table}
  end

  def execute_command(command, robot, table)
    key = command[0].upcase.to_sym
    @cmds[key].__send__(command[0].downcase, command, @cmds[key] == table ? robot : table) if @cmds.has_key?(key)
  end

end