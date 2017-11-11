defmodule PE005 do
  @moduledoc """
  Documentation for Problem 005 from Projet Euler.
  """

  @doc """
  Hello world.

  ## Examples

      iex> PE005.divisible_by_all_betwen?(2520, 2..10)
      true

      iex> PE005.divisible_by_all_betwen?(1234, 2..10)
      false
  """
  def divisible_by_all_betwen?(n, range) do
    0 == Enum.map(range, &(rem(n, &1)))
    |> Enum.reduce(0, &(&1 + &2))
  end


  @doc """
  Solves the problem.

  ## Examples

      iex> PE005.solve(1000..3000, 2..10)
      2520
  """
  def solve(limit, range) do
    limit
      |> Stream.drop_while(&(!divisible_by_all_betwen?(&1, range)))
      |> Stream.take(1)
      |> Enum.to_list
      |> hd
  end
end
