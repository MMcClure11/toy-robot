defmodule ToyRobot.Position do 
  @moduledoc """
  Documentation for `ToyRobot.Position`.
  """

  @doc """
  Defines the Struct with x and y coordinates as integers and the facing field for direction as an atom along with their default values:
  x: 0, y: 0, facing: :north
  """
  defstruct x: 0, y: 0, facing: :north
end