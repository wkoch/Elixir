defmodule PE006Test do
  use ExUnit.Case
  doctest PE006

  test "Solves the problem" do
    assert PE006.solve(1..100) == 25164150
  end
end
