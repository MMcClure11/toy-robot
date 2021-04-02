defmodule ToyRobot.CLI do

  @moduledoc """
  Documentation for `ToyRobot.CLI`.
  """

  @doc """
  Receives optional argument upon starting the simulator.
  Parses the arguments into a readable format and processes them if the arg == --help.
  """
  def main(args) do
    args |> parse_args |> process_args
  end

  @doc """
  Uses the public OptionParserModule and the parse method to take in the args and a second parameter to act as a rule for turning the help flag into a boolean.
  """
  def parse_args(args) do
    {params, _, _} =  OptionParser.parse(args, switches: [help: :boolean])
    params
  end

  @doc """
  If main was called with a --help flag, display the message.
  """
  def process_args([help: true]) do
    print_help_message()
  end

  @doc """
  If the main is called without the --help flag, it welcomes the user, prints the help message, and prepares to receive instructions.
  """
  def process_args(_) do
    IO.puts("Welcome to the Toy Robot simulator!")
    print_help_message()
    receive_command()
  end

  #Creates a map of key value pairs with the keys as the command and the value a description of the command.
  @commands %{
    "quit" => "Quits the simulator",
    "place" => "format: \"place [X,Y,F]\". " <>
      "Places the Robot into X,Y coordinate facing F (Default is 0,0,North). " <>
      "Where facing is: North, South, East, or West.",
    "report" => "The Toy Robot reports its position",
    "left" => "Rotates the robot to the left",
    "right" => "Rotates the robot to the right",
    "move" => "Moves the robot one position forward"
  }

  
  #Listens for the user's input, once it is received it removes whitespace and transforms it into a lowercase string.
  #Splits input between command itself and attributes to separate command from specifications for placement of robot.
  defp receive_command(robot \\ nil) do
    IO.gets("> ")
    |> String.trim
    |> String.downcase
    |> String.split(" ")
    |> execute_command(robot)
  end

  defp execute_command(["place"], _robot) do 
    {:ok, robot} = ToyRobot.place
    robot
    |> receive_command
  end

  defp execute_command(["place" | params], _robot) do
    {x, y, facing} = process_place_params(params)

    case ToyRobot.place(x, y, facing) do
      {:ok, robot} -> 
        receive_command(robot)
      {:failure, message} ->
        IO.puts message
        receive_command()
    end
  end

  defp execute_command(["left"], robot) do 
    robot
    |> ToyRobot.left
    |> receive_command
  end

  defp execute_command(["right"], robot) do 
    robot
    |> ToyRobot.right
    |> receive_command
  end

  defp execute_command(["move"], robot) do 
    robot
    |> ToyRobot.move
    |> receive_command
  end

  defp execute_command(["report"], nil) do 
    IO.puts "The robot has not been placed yet."
    receive_command()
  end 

  defp execute_command(["report"], robot) do 
    {x, y, facing} = robot 
    |> ToyRobot.report
    IO.puts String.upcase("#{x}, #{y}, #{facing}")
    receive_command(robot)
  end

  defp execute_command(["quit"], _robot) do
    IO.puts "\nConnection lost"
  end

  defp execute_command(_unknown, _robot) do
    IO.puts("\nInvalid command. I don't know what to do.")
    print_help_message()
    receive_command()
  end

  defp process_place_params(params) do 
    [x, y, facing] = params
    |> Enum.join(" ")
    |> String.split(",")
    |> Enum.map(&String.trim/1)
    {String.to_integer(x), String.to_integer(y), String.to_atom(facing)}
  end

  defp print_help_message do
    IO.puts("\nThe simulator supports the following commands:\n")
    @commands
    |> Enum.map(fn({command, description}) -> IO.puts("  #{command} - #{description}") end)
  end
end