defmodule PE004Test do
  use ExUnit.Case
  doctest PE004

  test "Solves Project Euler 004" do
    assert PE004.solve(999) == 906609
  end
end
