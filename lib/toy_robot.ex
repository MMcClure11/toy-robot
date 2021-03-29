defmodule ToyRobot do
  @moduledoc """
  Documentation for `ToyRobot`.
  """

  @doc """

  ## Examples

      iex> ToyRobot.place()
      %ToyRobot.Position{}

  """
  def place() do
    %ToyRobot.Position{x: 0, y: 0, facing: :north}
  end

  def place(x, y, facing) do
    %ToyRobot.Position{x: x, y: y, facing: facing}
  end

  def report(%ToyRobot.Position{x: x, y: y, facing: facing}) do 
    {x, y, facing}
  end

  def right(%ToyRobot.Position{facing: facing} = robot) do 
    directions_to_the_right = %{north: :east, east: :south, south: :west, west: :north}
    %ToyRobot.Position{robot | facing: directions_to_the_right[facing]}
  end
end
