defmodule PE003 do
  @moduledoc """
  Documentation for Problem 003 from Projet Euler.
  """

  @doc """
  Tests if a number is a prime.

  ## Examples

      iex> PE003.is_prime?(0)
      false
      
      iex> PE003.is_prime?(1)
      false

      iex> PE003.is_prime?(5)
      true
      
      iex> PE003.is_prime?(7)
      true

      iex> PE003.is_prime?(10)
      false
  """
  def is_prime?(n) do
    if n < 2 do
      false
    else
      try_prime = 1..n |> Enum.filter(&(rem(n, &1) == 0)) |> length
      case try_prime do
        2 -> true
        _ -> false
      end
    end
  end


  @doc """
  List prime factors of n.

  ## Examples

      iex> PE003.list_prime_factors(13195)
      [5, 7, 13, 29]
  """
  def list_prime_factors(n) do
    limit = case n do
      x when x < 10_000 -> x
      _                 -> 10_000
    end
    
    1..limit
    |> Enum.filter(&is_prime?/1)
    |> Enum.filter(&(rem(n, &1) == 0))
  end


  @doc """
  List prime factors of n.

  ## Examples

      iex> PE003.solve(13195)
      29
  """
  def solve(n) do
    list_prime_factors(n)
    |> List.last
  end

  def print do
    solve(600851475143) |> IO.puts
  end
end
