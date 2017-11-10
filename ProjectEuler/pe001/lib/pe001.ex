defmodule PE001 do
  @moduledoc """
  Documentation for Problem 001 from Projet Euler.
  """

  @doc """
  Filter multiples of 3 or 5

  ## Example

      iex> PE001.filter_multiples_of_3_or_5(1..10)
      [3, 5, 6, 9, 10]

  """
  def filter_multiples_of_3_or_5(list) do
    Enum.filter(list, fn x -> rem(x, 3) == 0 or rem(x, 5) == 0 end)
  end

  @doc """
  Solves Problem 001 from Project Euler

  ## Example

      iex> PE001.solve(1..9)
      23

  """
  def solve(list) do
    multiples = filter_multiples_of_3_or_5(list)
    
    Enum.reduce(multiples, 0, &(&1 + &2))
  end


  @doc """
  Prints the solution for Problem 001
  """
  def print() do
    IO.puts solve(1..999)
  end
end