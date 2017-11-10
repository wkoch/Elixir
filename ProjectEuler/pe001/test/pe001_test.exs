defmodule PE001Test do
  use ExUnit.Case
  doctest PE001

  test "Solution with input 1..999" do
    assert PE001.solve(1..999) == 233168
  end

end
