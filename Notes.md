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

  --> New funciton
  defp escript do 
    [main_module: ToyRobot.CLI]
  end

  $ touch lib/cli.ex
  write main function
  to compile
  $ mix escript.build
  to run the cli
  $ ./toy_robot

  when making changes to the CLI must rebuild the escript
  $ mix escript.build && ./toy_robot
  To run the script 
  $ ./toy_robot
  To see stand alone instructions
  $ ./toy_robot --help

  To create documentation:
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

  TODO
  [X] add readme instructions for accessing tests
  [] add readme instructions for accessing docs
  [] add documentation to CLI of what the functions are doing
  [] add CLI tests??
  [] tryout github instructions for publishing documentation