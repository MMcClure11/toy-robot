# Toy Robot Simulator

**Description**
- The application is a simulation of a toy robot moving on a square tabletop,
  of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but is not allowed to fall to descruction be. 
  Any movement that would result in the robot falling from the table is prevented, however further valid
  movement commands are still allowed.

The application can read commands of the following form:

    PLACE X,Y,F
    MOVE
    LEFT
    RIGHT
    REPORT

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

