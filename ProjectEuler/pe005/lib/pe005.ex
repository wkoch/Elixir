defmodule PE005 do
  @moduledoc """
  Documentation for PE005.
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
    Enum.reduce(Enum.map(range, &(rem(n, &1))), 0, &(&1 + &2)) == 0
  end


  @doc """
  Solves the problem.

  ## Examples

      iex> PE005.solve(1000..3000, 2..10)
      2520
  """
  def solve(limit, range) do
    Stream.take(Stream.drop_while(limit, &(!divisible_by_all_betwen?(&1, range))),1)
      |> Enum.to_list
      |> hd
  end
end
