defmodule PE007 do
  @moduledoc """
  Documentation for Problem 007 from Projet Euler.
  """

  @doc """
  Tests if a number is a prime.

  ## Examples

      iex> PE007.is_prime?(0)
      false
      
      iex> PE007.is_prime?(1)
      false

      iex> PE007.is_prime?(5)
      true
      
      iex> PE007.is_prime?(7)
      true

      iex> PE007.is_prime?(10)
      false
  """
  def is_prime?(n) when n <= 1 do
    false
  end
  
  def is_prime?(n) do
    try_prime = 1..n |> Enum.filter(&(rem(n, &1) == 0)) |> length
    case try_prime do
      2 -> true
      _ -> false
    end
  end


  @doc """
  Solves the problem.

  ## Examples

      iex> PE007.solve(6)
      13
  """
  def solve(n) do
    Stream.iterate(1, &(&1 + 1))
    |> Stream.filter(&(is_prime?(&1)))
    |> Stream.take(n)
    |> Enum.to_list
    |> List.last
  end
end
