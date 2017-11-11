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
    list
    |> Enum.filter(&(rem(&1, 3) == 0 or rem(&1, 5) == 0))
  end

  @doc """
  Solves Problem 001 from Project Euler

  ## Example

      iex> PE001.solve(1..9)
      23

  """
  def solve(list) do
    filter_multiples_of_3_or_5(list)
    |> Enum.reduce(0, &(&1 + &2))
  end


  @doc """
  Prints the solution for Problem 001
  """
  def print() do
    solve(1..999) |> IO.puts
  end
end