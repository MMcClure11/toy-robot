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

  receive_command/1 : Listens for the user's input, once it is received it removes whitespace and transforms it into a lowercase string.
  Splits input between command itself and attributes to separate command from specifications for placement of robot.

    defp receive_command(robot \\ nil) do
      IO.gets("> ")
      |> String.trim
      |> String.downcase
      |> String.split(" ")
      |> execute_command(robot)
    end

  ## TODO

- [X] add readme instructions for accessing tests
- [X] add readme instructions for accessing docs
- [X] add documentation to CLI of what the functions are doing
- [X] Cannot add documentation for private methods. Interesting.
- [] add comments to CLI for functionality of each method for personal understanding.
- [] tryout github instructions for publishing documentation