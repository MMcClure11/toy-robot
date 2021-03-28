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

  def report(robot) do 
    %ToyRobot.Position{x: x, y: y, facing: facing} = robot
    {x, y, facing}
  end
end
