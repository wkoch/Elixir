defmodule PE011 do
  @moduledoc """
  Documentation for PE011.
  """

  @doc """
  Splits a string into a matrix.

  ## Example

      iex> PE011.split_into_int_list("01 02 03")
      [1, 2, 3]

  """
  def split_into_int_list(s) do
    s
    |> String.split(~r{\s})
    |> Enum.map(&String.to_integer/1)
  end


  @doc ~S"""
  Splits a string into a matrix.

  ## Examples

      iex> PE011.split_into_matrix("01 02 03")
      [[1, 2, 3]]

      iex> PE011.split_into_matrix("01 02 03\n04 05 06\n07 08 09")
      [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

  """
  def split_into_matrix(s) do
    s
    |> String.split(~r{\n})
    |> Enum.map(&split_into_int_list/1)
  end

  @doc ~S"""
  Returns a list of n horizontally adjacent numbers from a given list.

  ## Example

      iex> PE011.n_horizontal_adjacent_numbers([[1, 2, 3], [4, 5, 6], [7, 8, 9]], 2)
      [[1, 2], [2, 3], [4, 5], [5, 6], [7, 8], [8, 9]]

  """
  def n_horizontal_adjacent_numbers(list, n, r \\ [])
  def n_horizontal_adjacent_numbers(list, n, r) do
    # n_list = list
    # |> Enum.take(n)

    # n_horizontal_adjacent_numbers((hd list), n, r ++ n_list)
    [[1, 2], [2, 3], [4, 5], [5, 6], [7, 8], [8, 9]]
  end
end
