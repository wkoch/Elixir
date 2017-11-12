defmodule PE005 do
  @moduledoc """
  Documentation for Problem 005 from Projet Euler.
  """

  @doc """
  Hello world.

  ## Examples

      iex> PE005.divisible_by_all_betwen?(2520, 1..10)
      true

      iex> PE005.divisible_by_all_betwen?(1234, 1..10)
      false
  """
  def divisible_by_all_betwen?(n, range) do
    range
    |> Stream.drop_while(&(rem(n, &1)==0))
    |> Stream.take(1)
    |> Enum.empty?
  end


  @doc """
  Solves the problem.

  ## Examples

      iex> PE005.solve(1..10)
      2520
  """
  def solve(range) do
    Stream.iterate(1, &(&1 + 1))
      |> Stream.drop_while(&(!divisible_by_all_betwen?(&1, range)))
      |> Stream.take(1)
      |> Enum.to_list
      |> hd
  end
end
