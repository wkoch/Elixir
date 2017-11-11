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
    Enum.map(1..n, &fib/1)
  end


  @doc """
  Reject odd numbers in a list.

  ## Example

      iex> PE002.reject_odds(1..9)
      [2, 4, 6, 8]
  """
  def reject_odds(list) do
    list |> Enum.reject(&Integer.is_odd/1)
  end


  @doc """
  Reject number bigger than specified.

  ## Example

      iex> PE002.reject_bigger_than(1..9, 4)
      [1, 2, 3, 4]
  """
  def reject_bigger_than(list, limit) do
    list |> Enum.reject(&(&1 > limit))
  end


  @doc """
  Solves the problem.

  ## Example

      iex> PE002.solve(100)
      44
  """
  def solve(limit) do
    list_n_fibs(34) # Little hack
    |> reject_bigger_than(limit)
    |> reject_odds
    |> Enum.reduce(0, &(&1 + &2))
  end


  @doc """
  Prints the solution for Problem 002.
  """
  def print do
    solve(4_000_000) |> IO.puts
  end
end
