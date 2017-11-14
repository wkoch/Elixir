defmodule PE010 do
  @moduledoc """
  Documentation for PE010.
  """


  @doc """
  Tests if a number is a prime.

  ## Examples

      iex> PE010.is_prime?(0)
      false
      
      iex> PE010.is_prime?(1)
      false

      iex> PE010.is_prime?(5)
      true
      
      iex> PE010.is_prime?(7)
      true

      iex> PE010.is_prime?(10)
      false
  """
  def is_prime?(n) when n < 2 do
    false
  end

  def is_prime?(n) when n < 4 do
    true
  end
  
  def is_prime?(n) do
    2..n-1
    |> Stream.filter(&(rem(n, &1) == 0))
    |> Stream.take(1)
    |> Enum.to_list
    |> Enum.empty?
  end


  @doc """
  Tests if a number is a prime.

  ## Examples

      iex> PE010.sieve_of_eratosthenes(0)
      []

      iex> PE010.sieve_of_eratosthenes(2)
      [2]

      iex> PE010.sieve_of_eratosthenes(7)
      [2, 3, 5, 7]

      iex> PE010.sieve_of_eratosthenes(10)
      [2, 3, 5, 7]

      iex> PE010.sieve_of_eratosthenes(11)
      [2, 3, 5, 7, 11]

      iex> PE010.sieve_of_eratosthenes(30)
      [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
  """
  def sieve_of_eratosthenes(limit) when limit < 2 do
    []
  end

  def sieve_of_eratosthenes(limit) when limit == 2 do
    [2]
  end

  def sieve_of_eratosthenes(limit) when limit < 5_000 do
    range = 2..div(limit, 2)
    composite = Enum.map(range, fn x -> Enum.map(range, &(x * &1)) end)
    |> List.flatten
    |> Enum.uniq
    |> Enum.sort
    |> Enum.filter(&(&1 <= limit))
    
    all = 2..limit
    |> Enum.to_list

    all -- composite
  end

  def sieve_of_eratosthenes(primes \\ [], start \\ 2, partial \\ 5_000, limit)
  def sieve_of_eratosthenes(primes, start, partial, limit) do
    range = start..partial
    composite = Enum.map(range, fn x -> Enum.map(range, &(x * &1)) end)
    |> List.flatten
    |> Enum.uniq
    |> Enum.sort
    |> Enum.filter(&(&1 <= limit))
    
    all = start..partial
    |> Enum.to_list

    prms = primes ++ (all -- composite)

    next = if partial*2 < limit do
       partial*2
    else
      limit
    end

    sieve_of_eratosthenes(prms, partial+1, next, limit)
  end


  @doc """
  Tests if a number is a prime.

  ## Examples

      iex> PE010.sieve_is_prime?(5)
      true

      iex> PE010.sieve_is_prime?(7)
      true

      iex> PE010.sieve_is_prime?(8)
      false

      iex> PE010.sieve_is_prime?(10)
      false

      iex> PE010.sieve_is_prime?(11)
      true
  """
  def sieve_is_prime?(limit) do
    range = 2..div(limit, 2)
    composite = Enum.map(range, fn x -> Enum.map(range, &(x * &1)) end)
    |> List.flatten
    |> Enum.uniq
    |> Enum.sort
    |> Enum.filter(&(&1 <= limit))
    
    all = 2..limit
    |> Enum.to_list

    all -- composite
    |> List.last == limit
  end


  @doc """
  Solves the problem.

  ## Example

      iex> PE010.solve(10)
      17

  """
  def solve(limit) do
    limit
    |> Primes.SieveOfEratosthenes.Ets.get_primes_list
    |> Enum.sum
  end
end
