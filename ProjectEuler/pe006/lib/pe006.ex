defmodule PE006 do
  @moduledoc """
  Documentation for Problem 006 from Projet Euler.
  """

  @doc """
  Squares an integer.

  ## Examples

      iex> PE006.square(2)
      4

      iex> PE006.square(5)
      25
  """
  def square(x) do
    x * x
  end


  @doc """
  Squares all numbers in a range and sums them.

  ## Examples

      iex> PE006.sum_of_squares(1..2)
      5

      iex> PE006.sum_of_squares(1..5)
      55

      iex> PE006.sum_of_squares(1..10)
      385
  """
  def sum_of_squares(range) do
    range
    |> Enum.map(&square/1)
    |> Enum.sum
  end


  @doc """
  Sums all numbers in a range and squares the result.

  ## Examples

      iex> PE006.square_of_sum(1..2)
      9

      iex> PE006.square_of_sum(1..5)
      225

      iex> PE006.square_of_sum(1..10)
      3025
  """
  def square_of_sum(range) do
    range
    |> Enum.sum
    |> square
  end


  @doc """
  Solves the problem.

  ## Example

      iex> PE006.solve(1..10)
      2640
  """
  def solve(range) do
    square_of_sum(range) - sum_of_squares(range)
  end
end
