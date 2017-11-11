defmodule PE003Test do
  use ExUnit.Case
  doctest PE003

  test "Solves Project Euler problem 003" do
    assert PE003.solve(600851475143) == 6857
  end
end
