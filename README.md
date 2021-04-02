# Toy Robot Simulator

**Description**
- The application is a simulation of a toy robot moving on a square tabletop,
  of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but is not allowed to fall to descruction. 
  Any movement that would result in the robot falling from the table is prevented, however further valid
  movement commands are still allowed.

The application can read commands of the following form:

    PLACE X,Y,F
    MOVE
    LEFT
    RIGHT
    REPORT

- PLACE puts the toy robot on the table in position X,Y and facing NORTH,
  SOUTH, EAST or WEST.
- The origin (0,0) can be considered to be the SOUTH WEST most corner.
- The first valid command to the robot is a PLACE command, after that, any
  sequence of commands may be issued, in any order, including another PLACE
  command. The application discards all commands in the sequence until
  a valid PLACE command has been executed.
- MOVE will move the toy robot one unit forward in the direction it is
  currently facing.
- LEFT and RIGHT will rotate the robot 90 degrees in the specified direction
  without changing the position of the robot.
- REPORT will announce the X,Y and F of the robot.

Example Input and Output
------------------------

### Example a

    place
    move
    report

Output:

    0,1,NORTH

### Example b

    place 1,1,north
    left
    report

Output:

    1,1,WEST

### Example c

    place 1,2,east
    move
    move
    left
    move
    report

Output:

    3,3,NORTH

## CLI

If you have Elixir installed on your system, you can fork and clone this directory. 
CD into the project directory and run 
   $ mix escript.build 
this builds the application to be used in the command line. 

The build command uses the name of the application as the file name. To start your simulator:
   $ ./toy_robot
Follow the instructions in the command line or see above for how to place and move your robot.



## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `toy_robot` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:toy_robot, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/toy_robot](https://hexdocs.pm/toy_robot).
