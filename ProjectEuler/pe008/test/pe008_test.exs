defmodule PE008Test do
  use ExUnit.Case
  doctest PE008

  test "Solves the problem" do
    assert PE008.solve(13) == 23514624000
  end
end
