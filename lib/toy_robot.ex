defmodule ToyRobot do
  @table_top_x 4
  @table_top_y 4

  @moduledoc """
  Documentation for `ToyRobot`.
  """

  @doc """
  Places the robot in the default position.

  ## Examples

      iex> ToyRobot.place
      {:ok, %ToyRobot.Position{facing: :north, x: 0, y: 0}}
  """
  def place() do
    {:ok, %ToyRobot.Position{}}
  end

  @doc """
  Places the robot in the specified position.

  Examples:
    iex> ToyRobot.place(1, 2, :south)
    %ToyRobot.Position{x: 1, y: 2, facing: :south}
  """

  def place(x, y, facing) do
    %ToyRobot.Position{x: x, y: y, facing: facing}
  end

  @doc """
  Procides the report of the robot's current position.

  Examples:
    iex> robot = ToyRobot.place(2, 3, :west)
    iex> ToyRobot.report(robot)
    {2, 3, :west}

  """

  def report(%ToyRobot.Position{x: x, y: y, facing: facing}) do 
    {x, y, facing}
  end

  @doc """
  Rotates the robot to the right.
  """
  @directions_to_the_right %{north: :east, east: :south, south: :west, west: :north}
  def right(%ToyRobot.Position{facing: facing} = robot) do 
    %ToyRobot.Position{robot | facing: @directions_to_the_right[facing]}
  end

  @doc """
  Rotates the robot to the left.
  """
  @directions_to_the_left Enum.map(@directions_to_the_right, fn {from, to} -> {to, from} end)
  def left(%ToyRobot.Position{facing: facing} = robot) do
    %ToyRobot.Position{robot | facing: @directions_to_the_left[facing]}
  end

  @doc """
  Moves the robot to the north, without permitting it to fall.
  """
  def move(%ToyRobot.Position{x: _x, y: y, facing: :north} = robot) when y < @table_top_y do 
    %ToyRobot.Position{robot | y: y + 1}
  end

  @doc """
  Moves the robot to the east, without permitting it to fall.
  """
  def move(%ToyRobot.Position{x: x, y: _y, facing: :east} = robot) when x < @table_top_x do
    %ToyRobot.Position{robot | x: x + 1}
  end

  @doc """
  Moves the robot to the south, without permitting it to fall.
  """
  def move(%ToyRobot.Position{x: _x, y: y, facing: :south} = robot) when y > 0 do 
    %ToyRobot.Position{robot | y: y - 1}
  end

  @doc """
  Moves the robot to the west, without permitting it to fall.
  """
  def move(%ToyRobot.Position{x: x, y: _y, facing: :west} = robot) when x > 0 do 
    %ToyRobot.Position{robot | x: x - 1}
  end

  @doc """
  Does not change the position of the robot.
  This function is used as fallback if the robot cannot move because it would fall.
  """
  def move(robot), do: robot

end
