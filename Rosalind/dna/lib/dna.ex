defmodule DNA do
  @moduledoc """
  A string is simply an ordered collection of symbols selected from some alphabet and formed into a word; the length of a string is the number of symbols that it contains.
  An example of a length 21 DNA string (whose alphabet contains the symbols 'A', 'C', 'G', and 'T') is "ATGCTTCAGAAAGGTCTTACG."

  Given: A DNA string s of length at most 1000 nt.

  Return: Four integers (separated by spaces) counting the respective number of times that the symbols 'A', 'C', 'G', and 'T' occur in s.
  """


  @doc """
  Separates a string into a list of characters.

  ## Example

      iex> DNA.string_to_list("AGCT")
      ["A", "G", "C", "T"]
  """
  def string_to_list(s) do
    s
    |> String.split(~r{[A-z]}, include_captures: true, trim: true)
  end


  @doc """
  Counts all occurences of any of the symbols in a list.

  ## Example

      iex> DNA.count_by(["A", "A", "C", "T", "T"], ["A", "C", "T"])
      [2, 1, 2]
  """
  def count_by(a, b, c \\ [])
  def count_by(_, [], acc) do
    acc
  end
  
  def count_by(dataset, [head|tail], acc) do
    r = dataset
    |> Enum.filter(&(&1 == head))
    |> Enum.count()
    count_by(dataset, tail, acc ++ [r])
  end


  @doc """
  Solves the problem.

  ## Example

      iex> DNA.solve("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC")
      [20, 12, 17, 21]
  """
  def solve(dataset) do
    symbols = dataset
    |> string_to_list()
    |> Enum.uniq()
    |> Enum.sort()

    dataset
    |> string_to_list()
    |> count_by(symbols)
  end
end
