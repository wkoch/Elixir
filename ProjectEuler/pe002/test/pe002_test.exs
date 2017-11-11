defmodule PE002Test do
  use ExUnit.Case
  doctest PE002

  test "Solves the problem" do
    assert PE002.solve(4_000_000) == 4613732
  end
end
