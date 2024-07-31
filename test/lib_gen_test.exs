defmodule LibGenTest do
  use ExUnit.Case
  doctest LibGen

  test "greets the world" do
    assert LibGen.hello() == :world
  end
end
