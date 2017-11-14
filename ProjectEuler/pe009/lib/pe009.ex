defmodule PE009 do
  @moduledoc """
   Documentation for Problem 009 from Projet Euler.
  """

  @doc """
  Tests if 3 numbers form a Pythagorean triplet.

  ## Examples

      iex> PE009.is_a_pythagorean_triplet?(3, 4, 5)
      true

      iex> PE009.is_a_pythagorean_triplet?(3, 2, 7)
      false

  """
  def is_a_pythagorean_triplet?(a, b, c) when a < b and b < c and a*a + b*b == c*c do
    true
  end

  def is_a_pythagorean_triplet?(_, _, _) do
    false
  end

  
  @doc """
  Finds a Pythagorean triplet by its sum.

  ## Example

      iex> PE009.find_pt_by_sum(12)
      {[3, 4, 5], 60}
  """
  def find_pt_by_sum(a \\ 1, b \\ 2, c \\ 3, sum)
  def find_pt_by_sum(a, b, c, sum) when a < b and b < c and a*a + b*b == c*c and a+b+c == sum do
    {[a, b, c], a*b*c}
  end
  
  def find_pt_by_sum(a, b, c, sum) when c+c <= sum do
    find_pt_by_sum(a, b, c+1, sum)
  end

  def find_pt_by_sum(a, b, c, sum) when b+c >= sum do
    find_pt_by_sum(a+1, a+2, a+3, sum)
  end
  
  def find_pt_by_sum(a, b, c, sum) when c+c >= sum do
    find_pt_by_sum(a, b+1, b+2, sum)
  end

  
  @doc """
  Solves the problem.

  ## Example

      iex> PE009.find_pt_by_sum(12)
      {[3, 4, 5], 60}
  """
  def solve(n) do
    find_pt_by_sum(n)
  end
end
