defmodule PE011Test do
  use ExUnit.Case
  doctest PE011

  # test "greets the world" do
  #   assert PE011.hello() == :world
  # end

  test "splits string into numbers list" do
    assert PE011.split_into_matrix("01 02 03\n04 05 06\n07 08 09")
                               == [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end
end
