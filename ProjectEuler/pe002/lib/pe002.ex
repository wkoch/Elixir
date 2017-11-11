defmodule PE002 do
  @moduledoc """
  Documentation for Problem 002 from Projet Euler.
  """

  require Integer


  @doc """
  Fibonacci.

  ## Examples

      iex> PE002.fib(10)
      55

      iex> PE002.fib(11)
      89

  """
  def fib(n) do
    case n do
      0 -> 0
      1 -> 1
      n -> fib(n-1) + fib(n-2)
    end
  end


  @doc """
  List n Fibonacci numbers.

  ## Examples

      iex> PE002.list_n_fibs(10)
      [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

      iex> PE002.list_n_fibs(11)
      [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
  """
  def list_n_fibs(n) do
    Enum.map(1..n, fn x -> PE002.fib(x) end)
  end


  @doc """
  Reject odd numbers in a list.

  ## Example

      iex> PE002.reject_odds(1..9)
      [2, 4, 6, 8]
  """
  def reject_odds(list) do
    Enum.reject(list, &Integer.is_odd/1)
  end


  @doc """
  Reject number bigger than specified.

  ## Example

      iex> PE002.reject_bigger_than(1..9, 4)
      [1, 2, 3, 4]
  """
  def reject_bigger_than(list, limit) do
    Enum.reject(list, fn x -> x > limit end)
  end


  @doc """
  Solves the problem.

  ## Example

      iex> PE002.solve(100)
      44
  """
  def solve(limit) do
    listed_fibs = list_n_fibs(34) # Little hack
    rejected_too_big = reject_bigger_than(listed_fibs, limit)
    filtered_odds = reject_odds(rejected_too_big)

    Enum.reduce(filtered_odds, 0, &(&1 + &2))
  end


  @doc """
  Prints the solution for Problem 002.
  """
  def print do
    IO.puts solve(4_000_000)
  end
end
