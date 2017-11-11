defmodule PE003 do
  @moduledoc """
  Documentation for PE003.
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
      case length(Enum.filter(1..n, fn x -> rem(n, x) == 0 end)) do
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
      _ -> y = 10_000
    end
    primes = Enum.filter(1..limit, fn x -> is_prime? x end)
    Enum.filter(primes, fn x -> rem(n, x) == 0 end)
  end


  @doc """
  List prime factors of n.

  ## Examples

      iex> PE003.solve(13195)
      29
  """
  def solve(n) do
    List.last(list_prime_factors(n))
  end

  def print do
    IO.puts solve(600851475143)
  end
end
