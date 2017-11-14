defmodule PE010Test do
  use ExUnit.Case
  doctest PE010

  test "Solves the problem" do
    assert PE010.solve(2_000_000) == 142913828922
  end
end
