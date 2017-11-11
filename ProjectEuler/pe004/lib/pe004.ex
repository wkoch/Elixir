defmodule PE004 do
  @moduledoc """
  Documentation for PE004.
  """

  @doc """
  Tests if a string is a palindrome.

  ## Examples

      iex> PE004.is_a_palindrome?(101)
      true
  """
  def is_a_palindrome?(n) do
    s = Integer.to_string(n)
    s == String.reverse(s)
  end

  
  @doc """
  Finds a palindrome from biggest product below a limit.

  ## Examples

      iex> PE004.find_palindrome_from_biggest_product(99)
      9009
  """
  def find_palindrome_from_biggest_product(n) do
    products = Enum.map(n..1, fn a -> Enum.map(n..1, fn b -> a * b end) end)
      |> List.flatten
    
    Enum.filter(products, &(is_a_palindrome?(&1)))
      |> Enum.sort
      |> List.last
  end


  def solve(n) do
    find_palindrome_from_biggest_product(n)
  end
end
