defmodule Mod do
  def product(list) when length(list) == 0, do: 0
  def product(list), do: product(list, 1)

  # Exit condition
  defp product([], acc), do: acc

  defp product([ head | tail], acc) do
    product(tail, acc * head)
  end
end

