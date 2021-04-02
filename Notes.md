To make the CLI:
in mix.exs add

    def project do
      [
        app: :toy_robot,
        version: "0.1.0",
        elixir: "~> 1.11",
        start_permanent: Mix.env() == :prod,
        deps: deps(),
        escript: escript() *<-- new line
      ]
    end

  --> New function

    defp escript do 
      [main_module: ToyRobot.CLI]
    end

    $ touch lib/cli.ex

Write the main function in ToyRobot.CLI, then to compile:

    $ mix escript.build

To run the cli.

    $ ./toy_robot

When making changes to the CLI rebuild the escript:

    $ mix escript.build && ./toy_robot

To run the script 

    $ ./toy_robot

To see stand alone instructions

    $ ./toy_robot --help

**To create documentation:**

    defp deps do
      [
        {:ex_doc, "~> 0.12"} <--New Line
        # {:dep_from_hexpm, "~> 0.3.0"},
        # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      ]
    end 

    $ mix deps.get
    $ mix docs
    $ cd doc
    $ open index.html

  ## CLI Functions

  @commands: Creates a map of key value pairs with the keys as the command and the value a description of the command.

  receive_command/1 : Listens for the user's input, once it is received it removes whitespace and transforms it into a lowercase string.
  Splits input between command itself and attributes to separate command from specifications for placement of robot.
  It receives the robot as an argument and passes it to the execute_command function. It has a default argument of nil if the robot has not been placed.

    defp receive_command(robot \\ nil) do
      IO.gets("> ")
      |> String.trim
      |> String.downcase
      |> String.split(" ")
      |> execute_command(robot)
    end

execute_command/2 : Receives a list. The first element of the list contains teh command, and if there is a second command, the raw parameters for placing a robot. This is the function that will be called if the place command is entered with arguments. 

ToyRobot.place/3 expects coordinates x and y to be integers and facing to be an atom.  process_place_params/1 transforms the params(see below).

Once the data is transformed, it is passed to ToyRobot.place/3 and if successful will listen to the user's next command while passing along the robot or provide a failure message if unsuccessful.

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

process_place_params/1 : Joins the params in case there is more than one element in the list, split the string by commas, remove whitespace, transform to tuple with valid data.

    defp process_place_params(params) do 
      [x, y, facing] = params
      |> Enum.join(" ")
      |> String.split(",")
      |> Enum.map(&String.trim/1)
      {String.to_integer(x), String.to_integer(y), String.to_atom(facing)}
    end

  ## TODO

- [X] add readme instructions for accessing tests
- [X] add readme instructions for accessing docs
- [X] add documentation to CLI of what the functions are doing
- [X] cannot add documentation for private methods, interesting
- [X] add notes for how more complex CLI functions are working