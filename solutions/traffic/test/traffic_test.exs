defmodule TrafficTest do
  use ExUnit.Case
  doctest Traffic

  test "greets the world" do
    assert Traffic.hello() == :world
  end
end
